class FormsController < ApplicationController

	def new
		@form = Form.new
	end
end
