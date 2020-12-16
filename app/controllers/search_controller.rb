class SearchController < ApplicationController
	# include AlgoliaSearch

	# algoliasearch do 

	# end

	def index
    search = params[:id]
    if search.present?

      search = search.downcase
      @results = Hash.new
      @results['products'] = Product.where("lower(title) LIKE :search", search: "%#{search}%")
      @results['alternatives'] = Alternative.where("lower(title) LIKE :search OR lower(description) LIKE :search", search: "%#{search}%")

      if @results['products'].present? && @results['alternatives'].present?
      	nbOfProducts = Product.count
      	nbOfSuggestions = 3
      	@results['suggestions'] = Array.new(nbOfSuggestions)

      	@results['suggestions'].map! do |suggestion|
      		suggestion = Product.find( rand(nbOfProducts))
      	end

      end
    end
	end
end