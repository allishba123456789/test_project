class UsersController < ApplicationController
	protect_from_forgery
	before_action :authenticate_user!, only: [:index, :show]
	before_action :set_user, only: [:show, :edit]
	
	def index
		@users = User.all
		authorize User
	end

	def show
		authorize @user
	end

	def forall
	end

	def edit
	end

	private
	def set_user
		@user = User.find(params[:id])		
	end

end
