class UsagesController < ApplicationController
  def index
    @usages = policy_scope(Usage)
  end

  def create
    subscription = Subscription.find(params[:subscription_id])
    usage = subscription.usages.new(params.require(:usage).permit(:no_of_units_used,:feature_id))
    authorize usage
    if usage.save
      redirect_to "/subscriptions/#{subscription.id}"
    else
      render plain: "Try Again"
    end
  end

  def new
  	@usage = Usage.new
    authorize @usage
  	@subscription = Subscription.find(params[:subscription_id])
    @plan = @subscription.plan
    @features = @plan.features
  end

end
