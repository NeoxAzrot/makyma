class ApplicationController < ActionController::Base
	add_breadcrumb '', :root_path

	def original_url
	  base_url + original_fullpath
	end
end
