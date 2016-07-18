class CustomersController < ApplicationController
	before_action :authenticate_user!
	
	def index
		user = User.find(current_user)
		if user.level == "Admin"
			respond_to do |format|
	      		format.html
		      	#format.json {render json: ReminderDatatable.new(view_context)}
		      	format.json {render json: CustomerDatatable.new(view_context)}
		    end
		else
			redirect_to show_todays_jobs_path
		end
	end

	def edit
		user = User.find(current_user)
		if user.level == "Admin"
			@customer = Customer.find(params[:id])
			@message = Message.new
			session[:customer_message] = @customer.id
		else
			redirect_to show_todays_jobs_path
		end
	end

	def update
		user = User.find(current_user)
		if user.level == "Admin"
			@customer = Customer.find(params[:id])	
			@customer.update(params.require(:customer).permit(:name, :company, :account_number, :phone_one, :phone_two, :phone_three, :phone_four, :fax, :email, :street, :city, :state, :zip))
			
			if @customer.valid?
				flash[:notice] = "Successfully Updated Customer"
				render "layouts/success"
				#render :js => "window.location = '/customers'"
			else
				flash[:error] = "Error Updating Customer"
				render "layouts/fail"
			end
		else
			redirect_to show_todays_jobs_path
		end
	end

	def new
		user = User.find(current_user)
		if user.level == "Admin"
			@customer = Customer.new
		else
			redirect_to show_todays_jobs_path
		end
	end

	def create
		user = User.find(current_user)
		if user.level == "Admin"
			c = Customer.create(params.require(:customer).permit(:name, :company, :account_number, :phone_one, :phone_two, :phone_three, :phone_four, :fax, :email, :street, :city, :state, :zip))	
			if c.valid?
				flash[:notice] = "Successfully Created Customer"
				render :js => "window.location = '/customers'"
			else
				flash[:error] = "Error Creating Customer"
				render "layouts/fail"
			end
		else
			redirect_to show_todays_jobs_path
		end
	end

	def destroy
		user = User.find(current_user)
		if user.level == "Admin"
			customer = Customer.find(params[:id])
			customer.destroy
			redirect_to customers_url
		else
			redirect_to show_todays_jobs_path
		end
	end
end
