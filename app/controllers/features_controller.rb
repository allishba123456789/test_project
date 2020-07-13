class FeaturesController < ApplicationController
  before_action :set_plan, only: [:create, :new]
  before_action :create_feature, only: :new

  def new
  end

  def create
    feature = @plan.features.new(get_params)
    if feature.save
     redirect_to plan_path(@plan)
   else
     feature.valid?
     if feature.errors.any?
      flash[:alert] = "Your fields are incorrect"
    end
    redirect_to new_plan_feature_path(@plan)
  end
end

private

def get_params
  params.require(:feature).permit(:name, :code, :unit_price, :max_no_of_units)
end

def set_plan
 @plan = Plan.find_by(id: params[:plan_id])
end

def create_feature
 @feature = Feature.new
end

end
