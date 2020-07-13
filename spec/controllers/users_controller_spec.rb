
require "rails_helper"

# RSpec.describe UsersController, type: :controller do
# 	before (:each) do
#     user = User.create(role:"admin", name: "Alishba", email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
#     sign_in user
#   end

#   it "Check Index Action" do
#     get :index
#     expect(response).to render_template(:index) # add gem 'rails-controller-testing' to your Gemfile first.
#     sign_out user
#     get root_path
#     expect(response).not_to render_template(:index) # add gem 'rails-controller-testing' to your Gemfile first.
#   end
# end

RSpec.describe UsersController do
 before (:each) do
    user = User.create!(billing_day: 4, role:"admin", name: "Alishba", email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
    user.name
    sign_in user
  end

  it "redirect when something went wrong" do
    get :index
    expect(response).to render_template("index")
  end

   it "redirect when something went wrong" do
    get :show
    expect(response).to render_template("show")
  end

end
   # it { expect(response).to be_success}
