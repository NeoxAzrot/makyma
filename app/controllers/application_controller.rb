class ApplicationController < ActionController::Base
	# A modifier pour ajouter sur toutes les pages quand le breadcrum marchera pour les pages statics
	#add_breadcrumb 'Accueil', :root_path

	def original_url
	  base_url + original_fullpath
	end

	def current_controller?(names)
		names.include?(params[:controller]) unless params[:controller].blank? || false
	end

	private
		def redirect_cannotManage(controller)
			if cannot? :manage, controller
				redirect_to :root
			end
		end

	helper_method :current_controller?
end
