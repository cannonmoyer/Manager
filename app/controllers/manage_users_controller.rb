class ManageUsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update!(params.require(:user).permit(:email, :level, :password, :password_confirmation))
		redirect_to users_url
	end

	def create
		#if user_signed_in? 
		#if user_signed_in and current_user.level == "Admin"?
			User.create!(params.require(:user).permit(:email, :level, :password, :password_confirmation))	
			redirect_to users_url
		#else 
			#redirect_to users_url
		#end	
		#User.create!(email: 'root@thefinaltouchsecurity.com', level: 'Admin', password: 'password', password_confirmation: 'password')
	end


end
