class FormsController < ApplicationController

	before_action :authenticate_user!
	def new
		@form = Form.new
	end
end
