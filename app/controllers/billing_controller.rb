class BillingController < ApplicationController
	before_action :authenticate_user!
	
	def index
		user = User.find(current_user)
		if user.level == "Admin"
			@jobs = Job.where(status: 'Completed But Not Billed').all
		else
			redirect_to show_todays_jobs_path
		end
	end

	def edit
		user = User.find(current_user)
		if user.level == "Admin"
			@job = Job.find(params[:id])
			@users = User.all
		else
			redirect_to show_todays_jobs_path
		end
	end

	def update
		@user = User.find(params[:job][:user_id])
		@job = Job.find(params[:id])
		begin
			Date.parse(params[:job][:date])	unless params[:job][:date] == ""
			@job.update(params.require(:job).permit(:date, :time, :time_sensitive, :address, :city, :state, :zip, :special_job_instructions, :description, :work_completed, :billing_information, :notes, :status))
			
			if @job.valid?	
				flash[:notice] = "Successfully Updated Job"
				@job.user = @user
				@job.save!
				render :js => "window.location = '/billing'"
			else
				flash[:error] = "Error Updating Job!"
				render "layouts/fail"
			end
		rescue
			flash[:error] = "Error Updating Job!"
			render "layouts/fail"
		end
	end
end


