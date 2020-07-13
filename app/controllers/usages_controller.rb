class UsagesController < ApplicationController
  def index
    @usages = policy_scope(Usage)
  end

  def create
    subscription = Subscription.find_by(id: params[:subscription_id])
    usage = subscription.usages.new(usage_param)
    authorize usage
    if usage.save
      flash[:notice] = "Usage created successfully"
      redirect_to subscription_path(subscription.id)
    else
      flash[:alert] = "No Usage created"
      redirect_to new_subscription_usage_path(subscription.id)
    end
  end

  def new
  	@usage = Usage.new
    authorize @usage
  	@subscription = Subscription.find_by(id: params[:subscription_id])
    @plan = @subscription.plan
    @features = @plan.features
  end

  private
  
  def usage_param
    params.require(:usage).permit(:no_of_units_used,:feature_id)
  end
  
end
