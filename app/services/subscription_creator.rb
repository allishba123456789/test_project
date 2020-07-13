class SubscriptionCreator

  def initialize(plan, current_user)
    @plan = plan
    @current_user = current_user
  end

  def create_subscription?
   ActiveRecord::Base.transaction do
     @subscription = @plan.subscriptions.new(user_id: @current_user.id)   
     if @subscription.save
      Transaction.create(chargeable_id: @subscription.id, 
        chargeable_type: "Subscription", date: Date.today, amount: @plan.monthly_fee)
      EmailMailer.subscription_email(@subscription, @current_user).deliver
      return true
     else
      return false
    end
  end
end

end





