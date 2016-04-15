class CallListsController < ApplicationController
	before_action :authenticate_user!

	def index
		user = User.find(current_user)
		if user.level == "Admin"
			@call_lists = CallList.all.order("created_at ASC")
		else
			redirect_to show_todays_jobs_path
		end
	end

	def new
		user = User.find(current_user)
		if user.level == "Admin"
			@call_list = CallList.new
		else
			redirect_to show_todays_jobs_path
		end
	end

	def create
		user = User.find(current_user)
		if user.level == "Admin"
			c = CallList.create(params.require(:call_list).permit(:name, :phone, :description))	
			if c.valid?
				flash[:notice] = "Successfully Created Record"
				render :js => "window.location = '/call_lists'"
			else
				flash[:error] = "Error Creating Record"
				render "layouts/fail"
			end
		else
			redirect_to show_todays_jobs_path
		end
	end

	def edit
		user = User.find(current_user)
		if user.level == "Admin"
			@call_list = CallList.find(params[:id])
		else
			redirect_to show_todays_jobs_path
		end
	end

	def update
		user = User.find(current_user)
		if user.level == "Admin"

			@call_list = CallList.find(params[:id])	
			@call_list.update(params.require(:call_list).permit(:name, :phone, :description))

			if @call_list.valid?
				flash[:notice] = "Successfully Updated Record"
				render :js => "window.location = '/call_lists'"
			else
				flash[:error] = "Error Updating Record"
				render "layouts/fail"
			end
		else
			redirect_to show_todays_jobs_path
		end
	end

	def destroy
		user = User.find(current_user)
		if user.level == "Admin"
			@call_list = CallList.find(params[:id])
			@call_list.destroy
			redirect_to call_lists_path
		else
			redirect_to show_todays_jobs_path
		end
	end

end
