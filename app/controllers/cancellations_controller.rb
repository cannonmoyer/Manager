class CancellationsController < ApplicationController
	before_action :authenticate_user!
	  def update
	  user = User.find(current_user)
			if user.level == "Admin"
				begin
					Date.parse(params[:cancellation][:date]) unless params[:cancellation][:date] == ""
					Date.parse(params[:cancellation][:start_date]) unless params[:cancellation][:start_date] == ""
					Date.parse(params[:cancellation][:renewal_date]) unless params[:cancellation][:renewal_date] == ""
					@cancellation = Cancellation.find(params[:id])	
					@cancellation.update!(params.require(:cancellation).permit(:date, :account_number, :start_date, :renewal_date, :landline_monitoring, 
						:cell_monitoring, :verified_cancellation, :cancel_pink, :cleared_account_balance, :remove_from_mem_tx, :cancel_insurance, 
						:note_customer_account, :cell_radio, :cancel_cell_radio))
					
					if @cancellation.valid?
						flash[:notice] = "Successfully Updated Cancellation"
						render :js => "window.location = '/customers/#{@cancellation.customer.id}/edit'"
					else
						flash[:error] = "Error Updating Cancellation"
						render "layouts/fail"
					end
				rescue
					flash[:error] = "Error Updating Cancellation!"
					render "layouts/fail"
				end
			else
				redirect_to show_todays_jobs_path
			end
	  end

	def create
		u = User.find(current_user)
		if u.level == "Admin"
			customer = Customer.find(params[:id])
			@cancellation = customer.cancellations.create(landline_monitoring: 0, cell_monitoring: 0)
			
			redirect_to edit_cancellation_path(@cancellation)
		else
			redirect_to show_todays_jobs_path
		end
	end

	def edit
		user = User.find(current_user)
	  	if user.level == "Admin"
	  		@cancellation = Cancellation.find(params[:id])
	  	else
			redirect_to show_todays_jobs_path
		end
	end

	def destroy
		user = User.find(current_user)
		if user.level == "Admin"
			cancellation = Cancellation.find(params[:id])
			customer = cancellation.customer.id
			cancellation.destroy
			redirect_to customer_cancellations_path(customer)
		else
			redirect_to show_todays_jobs_path
		end
	end

	def cancellations
		user = User.find(current_user)
		if user.level == "Admin"
			customer = Customer.find(params[:id])
			@cancellations = customer.cancellations.all
		else
			redirect_to show_todays_jobs_path
		end
	end

	def view
		user = User.find(current_user)
		if user.level == "Admin"
			@cancellation = Cancellation.find(params[:id])
		else
			redirect_to show_todays_jobs_path
		end
	end

end
