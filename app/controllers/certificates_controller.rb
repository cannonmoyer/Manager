class CertificatesController < ApplicationController
  before_action :authenticate_user!
  def update
  	user = User.find(current_user)
		if user.level == "Admin"

			begin
				Date.parse(params[:certificate][:start_date]) unless params[:certificate][:start_date] == ""
				Date.parse(params[:certificate][:renewal_date]) unless params[:certificate][:renewal_date] == ""
				@certificate = Certificate.find(params[:id])	
				@certificate.update!(params.require(:certificate).permit(:burglary, :fire, :panic, :hold_up, :account_number, :start_date, :renewal_date, :to, :attention))
				
				if @certificate.valid?
					flash[:notice] = "Successfully Updated Certificate"
					render :js => "window.location = '/customers/#{@certificate.customer.id}/edit'"
				else
					flash[:error] = "Error Updating Certificate"
					render "layouts/fail"
				end
			rescue
				flash[:error] = "Error Updating Certificate!"
				render "layouts/fail"
			end
		else
			redirect_to show_todays_jobs_path
		end
  end

  def edit
  	user = User.find(current_user)
  	if user.level == "Admin"
  		@certificate = Certificate.find(params[:id])
  	else
			redirect_to show_todays_jobs_path
	end
  end

  def create
		u = User.find(current_user)
		if u.level == "Admin"
			customer = Customer.find(params[:id])
			@certificate = customer.certificates.create!()
			
			
			redirect_to edit_certificate_path(@certificate)
		else
			redirect_to show_todays_jobs_path
		end
	end

	def certificates
		user = User.find(current_user)
		if user.level == "Admin"
			customer = Customer.find(params[:id])
			@certificates = customer.certificates.all
		else
			redirect_to show_todays_jobs_path
		end
	end

	def view
		user = User.find(current_user)
		if user.level == "Admin"
			@certificate = Certificate.find(params[:id])
		else
			redirect_to show_todays_jobs_path
		end
	end
end
