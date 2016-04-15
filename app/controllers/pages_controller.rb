class PagesController < ApplicationController
	def index

	end

	def new
		@page = Page.new		
	end

	def create
		@job = Job.find(session[:edit_job])
		@page = @job.pages.create(params.require(:page).permit(:name, :content))	
		if @page.valid?
			flash[:notice] = "Successfully Created Page."
			redirect_to edit_job_path(@job)
		else
			flash[:notice] = "Error Creating Page!"
			redirect_to new_page_path()
		end
	end 

	def edit
		@page = Page.find(params[:id])
	end

	def update
		@job = Job.find(session[:edit_job])
		puts params[:page][:name] + "asdfadadfasdfadfadf\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
		@page = Page.find(params[:id])
		@page.update(params.require(:page).permit(:name, :content))
			
			if @page.valid?	
				flash[:notice] = "Successfully Updated Page."
				redirect_to edit_job_path(@job)
			else
				flash[:error] = "Error Updating Page!"
				redirect_to edit_page_path(@page)
			end
	end

	def destroy
			page = Page.find(params[:id])
			page.destroy
			redirect_to job_pages_path(session[:edit_job])
		
	end

	def pages
		@job = Job.find(params[:id])
		@pages = @job.pages.all
	end
end
