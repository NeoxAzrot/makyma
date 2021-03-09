class PagesController < ApplicationController

	def show
		render template: "pages/#{params[:page]}"
	end
	
	def about 
		add_breadcrumb 'À propos'
	end

	def cgu 
		add_breadcrumb 'Mentions légales'
	end

	def presse 
		add_breadcrumb 'Nos ressources presse'
	end

	def suggestion 
		add_breadcrumb 'Proposer une alternative'
	end

end
