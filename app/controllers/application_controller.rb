class ApplicationController < ActionController::Base
	add_breadcrumb "", :root_path

	def index
		@categories = Category.all
	end

end
