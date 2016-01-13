class CallListsController < ApplicationController

	def index
		@call_lists = CallList.all
	end

	def new
		@call_list = CallList.new
	end

	def create
		c = CallList.create(params.require(:call_list).permit(:name, :phone, :description))	

		if c.valid?
			flash[:notice] = "Successfully Created Record"
			redirect_to call_lists_path
			
		else
			flash[:error] = "Error Creating Record"
			redirect_to new_call_list_path
		end
	end

	def edit
		@call_list = CallList.find(params[:id])
	end

	def update
		@call_list = CallList.find(params[:id])	
		@call_list.update!(params.require(:call_list).permit(:name, :phone, :description))

		if @call_list.valid?
			flash[:notice] = "Successfully Updated Record"
			redirect_to call_lists_path
		else
			flash[:error] = "Error Updating Record"
			redirect_to edit_call_list_path(@call_list)
		end
	end

	def destroy
		@call_list = CallList.find(params[:id])
		@call_list.destroy
		redirect_to call_lists_path
	end

end
