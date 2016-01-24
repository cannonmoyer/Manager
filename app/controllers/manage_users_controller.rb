class ManageUsersController < ApplicationController
	before_action :authenticate_user!
	
	def index
		user = User.find(current_user)
		if user.level == "Admin"
			@users = User.all
		else
			redirect_to show_todays_jobs_path
		end
	end

	def new
		user = User.find(current_user)
		if user.level == "Admin"
			@user = User.new
		else
			redirect_to show_todays_jobs_path
		end
	end

	def edit
		user = User.find(current_user)
		if user.level == "Admin"
			@user = User.find(params[:id])
		else
			redirect_to show_todays_jobs_path
		end
	end

	def update
		user = User.find(current_user)
		if user.level == "Admin"
			@user = User.find(params[:id])
			@user.update!(params.require(:user).permit(:email, :level, :password, :password_confirmation))
			redirect_to users_url
		else
			redirect_to show_todays_jobs_path
		end
	end

	def create
		user = User.find(current_user)
		if user.level == "Admin"
			User.create!(params.require(:user).permit(:email, :level, :password, :password_confirmation))	
			redirect_to users_url
		else
			redirect_to show_todays_jobs_path
		end
	
	end


end
