class TransactionsController < ApplicationController
  def index
    @transactions = policy_scope(Transaction)

  end

  def create
  end

  def new
  	# For only today's Billing Day Users
    latestTransaction = Transaction.last
    if latestTransaction.date == Date.today && latestTransaction.chargeable_type == "Feature"
      flash[:alert] = "You are allowed once to generate Transaction"
      redirect_to "/transactions"
    else 
     @users = User.where("billing_day = ?", Date.today.day)
     @message = "You must Try it Again"
     @users.each do | user | 
      user.subscriptions.each do | subscription |
       subscription.plan.features.each do | feature |
        usedUnits = Usage.where(feature_id: feature.id,
         subscription_id: subscription.id).sum(:no_of_units_used)
        if usedUnits > feature.max_no_of_units
         overUse = usedUnits - feature.max_no_of_units
         extraPayable = overUse*feature.unit_price
         transaction =Transaction.new(chargeable_id: feature.id, chargeable_type: "Feature", 
          date: Date.today, amount: extraPayable )
         if transaction.save
          @message = "You do it successfully, Congrats"
          EmailMailer.transaction_email(user,extraPayable, subscription.plan, feature, overUse).deliver
        end
      end
    end
  end
end
end
end
end
