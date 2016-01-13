class JobsController < ApplicationController
	def index
		#user = User.find(current_user)
		#if user.level == "Admin"        
			@jobs = current_user.jobs.where(status: 'Scheduled').all
		#else

		#nd
	end

	def todays_jobs
		@jobs = current_user.jobs.where(status: 'Scheduled').all
		render "jobs"
	end

	def active_jobs
		@jobs = Job.where.not(status: "Completed But Not Billed").where.not(status: "Completed And Billed")
	end

	def search
		k = params[:keyword].downcase
		if k == "empty"
			@jobs = Job.all
		else
			@jobs = []
			Job.all.each do |j|
				if j.id.to_s.downcase.include? k or j.customer.name.downcase.include? k or j.customer.phone_one.include? k or j.status.downcase.include? k
					@jobs << j
				end
			end
		end
		respond_to do |format|
			format.html {redirect_to customers_url}
			format.js {}
		end
	end

	def create
		@customer = Customer.find(params[:id])
		@job = @customer.jobs.create!(status:'Waiting To Be Scheduled')
		redirect_to edit_job_path(@job)
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
		redirect_to customers_url
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to customers_url
	end

	def jobs
		@customer = Customer.find(params[:id])
		@jobs = @customer.jobs.all

	end

	def user_jobs
		@user = User.find(params[:id])
		@jobs = @user.jobs.all
	end
end
