class BillingDayCallGenerator
  def initialize()
  end

  def transaction?
    if applicableToday?
      @users = User.where("billing_day = ?", Date.today.day)
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
            EmailMailer.transaction_email(user,extraPayable, subscription.plan, feature, overUse).deliver 
            return true
          else
            return false
          end
        end
      end
    end
  end
else
  return false
end

end

private

def applicableToday?
  latestTransaction = Transaction.last
  return false if latestTransaction.date == Date.today && latestTransaction.chargeable_type == "Feature"
  true
end

end

#  scope.joins(subscription: :user).where('users.email'=> user.email)
# @users = User.joins(subscription: )where("billing_day = ?", Date.today.day)

