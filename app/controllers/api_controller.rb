class ApiController < ApplicationController
	respond_to :json
	TOKEN = "secret"

	before_action :authenticate#, except: [ :index ]

	def index
	    render json: @customers = Customer.where("created_at >= ?", Time.zone.now.beginning_of_day)
	    
	end

	def edit
		render plain: "I'm only accessible if you know the password"
	end

	private 
		def authenticate
	 	   authenticate_or_request_with_http_token do |token, options|
	       token == TOKEN
	    end
	end
end
