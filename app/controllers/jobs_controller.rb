class JobsController < ApplicationController
	before_action :authenticate_user!
	
	def todays_jobs
		@jobs = current_user.jobs.where(status: 'Scheduled & Released').all.order("date ASC").order("time ASC")
		render "jobs"
	end

	def active_jobs
		user = User.find(current_user)
		if user.level == "Admin"
			@jobs = Job.where.not(status: "Completed But Not Billed").where.not(status: "Completed And Billed").where.not(status: "Complete").all.order("date ASC").order("time ASC")
		else
			redirect_to show_todays_jobs_path
		end
	end

	def search
		k = params[:keyword].downcase
		if k == "empty"
			@jobs = Job.where.not(status: "Completed But Not Billed").where.not(status: "Completed And Billed").where.not(status: "Complete").all.order("date ASC").order("time ASC")
		else
			@jobs = []
			Job.where.not(status: "Completed But Not Billed").where.not(status: "Completed And Billed").where.not(status: "Complete").all.each do |j|
				if (j.customer.name != nil and j.customer.name.downcase.include? k) or (j.customer.phone_one != nil and j.customer.phone_one.include? k) or (j.city != nil and j.city.downcase.include? k) or (j.customer.city != nil and j.customer.city.downcase.include? k) or (j.date != nil and j.date.to_s.include? k) or (j.status != nil and j.status.downcase.include? k) or (j.description != nil and j.description.downcase.include? k)
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
		u = User.find(current_user)
		if u.level == "Admin"
			@customer = Customer.find(params[:id])
			@job = @customer.jobs.create(status:'Waiting To Be Scheduled')
			@job.user = u
			@job.save!
			redirect_to edit_job_path(@job)
		else
			redirect_to show_todays_jobs_path
		end
	end

	def edit
		@cur_user = User.find(current_user)
		if @cur_user.level == "Admin"
			@job = Job.find(params[:id])
			session[:edit_job] = @job.id
			@users = User.all
		else
			job = Job.find(params[:id])
			if job.user == @cur_user
				@job = job
				session[:edit_job] = @job.id
				@users = User.all
			else
				redirect_to show_todays_jobs_path	
			end
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
				render "layouts/success"
			else
				flash[:error] = "Error Updating Job!"
				render "layouts/fail"
			end
		rescue
			flash[:error] = "Error Updating Job!"
			render "layouts/fail"
		end
	end

	def destroy
		user = User.find(current_user)
		if user.level == "Admin"
			job = Job.find(params[:id])
			job.destroy
			redirect_to customers_url
		else
			redirect_to show_todays_jobs_path
		end
	end

	def jobs
		user = User.find(current_user)
		if user.level == "Admin"
			@customer = Customer.find(params[:id])
			@jobs = @customer.jobs.all.order("date ASC").order("time ASC")
			@messages = @customer.messages.where(status: "Note").all.order("created_at ASC")
		else
			redirect_to show_todays_jobs_path
		end
	end

	def user_jobs
		user = User.find(current_user)
		if user.level == "Admin"
			@user = User.find(params[:id])
			@jobs = @user.jobs.where.not(status: "Completed But Not Billed").where.not(status: "Completed And Billed").where.not(status: "Complete").all.order("date ASC").order("time ASC")
		else
			redirect_to show_todays_jobs_path
		end
	end

	def customer_jobs
		user = User.find(current_user)
		if user.level == "Admin"
			@customer = Customer.find(params[:id])
			@jobs = @customer.jobs.all.order("date ASC").order("time ASC")
			@messages = @customer.messages.where(status: "Note").all.order("created_at ASC")
		else
			redirect_to show_todays_jobs_path
		end
	end
end
