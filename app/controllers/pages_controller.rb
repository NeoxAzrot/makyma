class PagesController < ApplicationController
	#add_breadcrumb 'test', '/'

	def show
		render template: "pages/#{params[:page]}"
	end

end
