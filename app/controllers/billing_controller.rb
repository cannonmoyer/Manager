class BillingController < ApplicationController
	def index
		@jobs = Job.where(status: 'Completed But Not Billed').all
	end

	def edit
		@job = Job.find(params[:id])
		@users = User.all
	end

	def update
		@user = User.find(params[:job][:user_id])
		@job = Job.find(params[:id])	
		@job.update(params.require(:job).permit(:date, :time, :address, :city, :state, :zip, :special_job_instructions, :description, :work_completed, :billing_information, :notes, :status))
		@job.user = @user
		@job.save!
		redirect_to billing_index_url
	end
end
