class PagesController < ApplicationController
	#add_breadcrumb 'test', '/'

	def show
		render template: "pages/#{params[:page]}"
	end
	
	def about 
		add_breadcrumb 'Accueil', :root_path
		add_breadcrumb 'À propos', 'about'
	end

	def cgu 
		add_breadcrumb 'Accueil', :root_path
		add_breadcrumb 'Mentions Légales', 'cgu'
	end

	def presse 
		add_breadcrumb 'Accueil', :root_path
		add_breadcrumb 'Nos ressources presse', 'Presse'
	end

	def suggestion 
		add_breadcrumb 'Accueil', :root_path
		add_breadcrumb 'Proposer une alternative', 'suggestion'
	end

end
