class ReceiptsController < ApplicationController
	before_action :authenticate_user!

	def index
		user = User.find(current_user)
		if user.level == "Admin"
			@receipts = Receipt.all
		else
			redirect_to show_todays_jobs_path
		end
	end 

	def new
		@receipt = Receipt.new
	end

	def create
		@job = Job.find(session[:edit_job])
		@receipt = @job.receipts.create(params.require(:receipt).permit(:email, :information))	
		if @receipt.valid?
			begin
				email
				render :js => "window.location = '/jobs/#{session[:edit_job]}/edit'"
			rescue
				@receipt.destroy
				flash[:error] = "Error Sending Email!"
				render "layouts/fail"
			end
		else
			flash[:error] = "Error Sending Email!"
			render "layouts/fail"
		end
	end

	def email
				CustomerMailer.email_receipt(@receipt).deliver_now
				flash[:notice] = "Email Sent Successfully."		
	end

	def receipts
		@job = Job.find(params[:id])
		@receipts = @job.receipts.all
	end

end
