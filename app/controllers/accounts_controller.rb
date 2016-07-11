class AccountsController < ApplicationController
	before_action :authenticate_user!
	def index
		user = User.find(current_user)
		if user.level == "Admin"
			@accounts = Account.all.order(line_number: :asc)
		else
			redirect_to show_todays_jobs_path
		end
	end

	def update
		user = User.find(current_user)
		if user.level == "Admin"
			account = Account.find(params[:id])

			account.update(params.require(:account).permit(:name))
			if account.valid?
				flash[:notice] = "Successfully Updated Account Record."
				render "update"
			else
				flash[:error] = "Error Updating Account Record."
				render "update_fail"
			end
		else
			redirect_to show_todays_jobs_path
		end

	end

	def create
		user = User.find(current_user)
		if user.level == "Admin"
			begin
				start = params[:start_value].to_i
				stop = params[:end_value].to_i

				until start > stop do 
					Account.create!(line_number: params[:line_number], number: start)
					start = start + 1
				end
				redirect_to accounts_path
			rescue
				flash[:error] = "Error Creating Batch Account Numbers."
				redirect_to new_account_path
			end
		else
			redirect_to show_todays_jobs_path
		end
		
		
	end

	def new
		user = User.find(current_user)
		if user.level != "Admin"
			redirect_to show_todays_jobs_path
		end
	end

	def search
		user = User.find(current_user)
		if user.level == "Admin"
			keyword = params[:keyword]
			if keyword != "empty"
				@accounts = Account.all.where(line_number: keyword).order(number: :asc)
			else
				@accounts = Account.all.order(line_number: :asc)

			end
		else
			redirect_to show_todays_jobs_path
		end
	end
end
