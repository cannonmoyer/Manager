class CustomersController < ApplicationController
	def index
		respond_to do |format|
      		format.html
	      	#format.json {render json: ReminderDatatable.new(view_context)}
	      	format.json {render json: CustomerDatatable.new(view_context)}
	    end
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])	
		@customer.update(params.require(:customer).permit(:name, :company, :account_number, :phone_one, :phone_two, :phone_three, :phone_four, :fax, :email, :street, :city, :state, :zip))
		
		if @customer.valid?
			flash[:notice] = "Successfully Updated Customer"
			redirect_to customers_url
		else
			flash[:error] = "Error Updating Customer"
			redirect_to edit_customer_path(@customer)
		end
	end

	def new
		@customer = Customer.new
	end

	def create
		c = Customer.create(params.require(:customer).permit(:name, :company, :account_number, :phone_one, :phone_two, :phone_three, :phone_four, :fax, :email, :street, :city, :state, :zip))	
		if c.valid?
			flash[:notice] = "Successfully Created Customer"
			redirect_to customers_path
		else
			flash[:error] = "Error Creating Customer"
			redirect_to new_customer_path
		end
	end

	def destroy
		customer = Customer.find(params[:id])
		customer.jobs.destroy_all
		customer.destroy
		redirect_to customers_url
	end
end
