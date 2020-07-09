class FeaturesController < ApplicationController
  def new
		@feature = Feature.new
  end

  def create
  	@plan = Plan.find(params[:plan_id]) # Probably should verify this gets something
  	if @plan.features.create(get_params)
    	redirect_to plan_path(@plan)
  	else
    	render :new
    end
  end

  private

  def get_params
  	params.require(:feature).permit(:name, :code, :unit_price)
  end
end
