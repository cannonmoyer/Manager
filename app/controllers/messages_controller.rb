class MessagesController < ApplicationController

	before_action :authenticate_user!

	def index
		user = User.find(current_user)
		if user.level == "Admin"
			@messages = Message.where(status: ['Message', nil]).all.order("created_at ASC")
		else
			redirect_to show_todays_jobs_path
		end
	end

	def create
		user = User.find(current_user)
		customer = Customer.find(session[:customer_message])
		if user.level == "Admin"
			m = customer.messages.create(params.require(:message).permit(:description, :status))	
			if m.valid?
				flash[:notice] = "Successfully Created Message"
				render :js => "window.location = '/customers'"
			else
				flash[:error] = "Error Creating Message"
				render "layouts/fail_two"

			end
		else
			redirect_to show_todays_jobs_path
		end
	end

	def create_job
		u = User.find(current_user)
		if u.level == "Admin"
			@message = Message.find(params[:id])
			@message.update(status: "Note")
			@customer = @message.customer
			@job = @customer.jobs.create(status:'Waiting To Be Scheduled', description: @message.description)
			@job.user = u
			@job.save!
			redirect_to edit_job_path(@job)
		else
			redirect_to show_todays_jobs_path
		end
	end

	def edit
		user = User.find(current_user)
		if user.level == "Admin"
			@message = Message.find(params[:id])
		else
			redirect_to show_todays_jobs_path
		end
	end

	def update
		user = User.find(current_user)
		if user.level == "Admin"

			@message = Message.find(params[:id])	
			@message.update(params.require(:message).permit(:description, :status, :new_customer))

			if @message.valid?
				flash[:notice] = "Successfully Updated Message"
				render :js => "window.location = '/messages'"
			else
				flash[:error] = "Error Updating Message"
				render "layouts/fail"
			end
		else
			redirect_to show_todays_jobs_path
		end
	end

	def destroy
		user = User.find(current_user)
		if user.level == "Admin"
			@message = Message.find(params[:id])
			@message.destroy
			redirect_to messages_path
		else
			redirect_to show_todays_jobs_path
		end
	end
end




