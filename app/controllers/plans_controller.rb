class PlansController < ApplicationController
  after_action :verify_authorized, only: [:new, :create]
  before_action :skip_authorization, only: :index

  def index
  	@plans = Plan.all
  end

  def new
		@plan = Plan.new
    authorize @plan
  end

  def create
  	@plan = Plan.new(get_params)
    authorize @plan
  	if @plan.save
  		redirect_to plans_path
  	else
  		render plain: "Plan not created"
  	end
  end

  def show
  	@plan = Plan.find(params[:id])
  end

def user_not_authorized
    flash[:alert] = "Access Denied"
    redirect_to users_forall_path
  end

  private

  def get_params
  	params.require(:plan).permit(:name, :monthly_fee)
  end
end
