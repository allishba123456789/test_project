class SubscriptionsController < ApplicationController
	def new
		@plan = Plan.find(params[:plan_id])
		@subscription = @plan.subscriptions.new(user_id: current_user.id)
		authorize @subscription
		
		ActiveRecord::Base.transaction do
			if @subscription.save
				Transaction.create(chargeable_id: @subscription.id, 
					chargeable_type: "Subscription", date: Date.today, amount: @plan.monthly_fee)
  				EmailMailer.subscription_email(@subscription, current_user).deliver

				puts "I am successful"
				redirect_to "/users/#{current_user.id}"
			else
				puts "Try Again, Please"
				render plain: "No Subscriptions and No Transactions"
			end
		end
	end

	def index
		@user = User.find(params[:user_id])
	end

	def show
		@subscription = Subscription.find(params[:id])
		@plan = @subscription.plan
		@features = @plan.features
	end

end
