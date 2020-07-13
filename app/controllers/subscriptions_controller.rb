class SubscriptionsController < ApplicationController
  before_action :set_plan, only: :new
  before_action :set_user, only: :index

  def new
    authorize Subscription
    flash[:alert] = "Subscriptions is not generated" unless SubscriptionCreator.new(@plan, current_user).create_subscription?
    redirect_to user_path(current_user.id)
  end

  def index
  end

  def show
    @subscription = Subscription.find_by(id: params[:id])
    @plan = @subscription.plan
    @features = @plan.features
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_plan
    @plan = Plan.find_by(id: params[:plan_id])
  end
end
