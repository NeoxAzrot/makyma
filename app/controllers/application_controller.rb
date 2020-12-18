class ApplicationController < ActionController::Base
	add_breadcrumb '', :root_path

	def original_url
	  base_url + original_fullpath
	end


	def current_controller?(names)
		names.include?(params[:controller]) unless params[:controller].blank? || false
	end

	helper_method :current_controller?
end
