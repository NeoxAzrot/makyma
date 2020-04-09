class PagesController < ApplicationController
	add_breadcrumb "pages"

	def show
		render template: "pages/#{params[:page]}"
	end

end
