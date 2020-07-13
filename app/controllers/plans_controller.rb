class PlansController < ApplicationController
  before_action :set_plan, only: :show

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
      flash[:notice] = "Your Plan has been created"      
      redirect_to plans_path
    else
     flash[:alert] = "Your Plan is not created"
     redirect_to new_plan_path
   end
 end

 def show
 end

 private

 def get_params
   params.require(:plan).permit(:name, :monthly_fee)
 end

 def set_plan
   @plan = Plan.find_by(id: params[:id])
 end
end
