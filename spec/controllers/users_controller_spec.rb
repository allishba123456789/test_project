
require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      before { get :index }
      it { should redirect_to(plans_path) }
      it { should redirect_to(action: :index) }
    end
  end
end