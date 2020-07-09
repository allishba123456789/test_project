class UsersController < ApplicationController
	protect_from_forgery
	before_action :authenticate_user!, only: [:index, :show]

	def index
		@users = User.all
		authorize User
	end

	def show
		@user = User.find(params[:id])
		authorize @user
	end

	def forall
	end

	def edit
		@user = User.find(params[:id])
	end

=begin

	def destroy
		@user = User.find(param[:id])
		@user.destroy
		redirect_to users_path, :notice => "User Deleted"
	end

=end
end
