class SearchController < ApplicationController

	def index
    @search = params[:id].downcase
    @nbOfResults = 0

    #fill product dico
    dico = Array.new
    Product.all.each do |product|
      product.title.split(/[^[[:word:]]]+/).map do |word| 
        if !word.parameterize.in?(dico)
          dico.push(word.parameterize)
        end
      end
    end
    Alternative.all.each do |alternative|
      alternative.title.split(/[^[[:word:]]]+/).map do |word| 
        if !word.parameterize.in?(dico)
          dico.push(word.parameterize)
        end
      end
    end
    dico.sort!

    #search search in dico
    spell_checker = DidYouMean::SpellChecker.new(dictionary: dico)
    dicoResult = spell_checker.correct(@search).last

    searchItems = [@search, dicoResult]

    #query the dico result
    if @search.present?
      @products = Array.new
      @alternatives = Array.new

      searchItems.each do |item|
        @products += Product.where("lower(title) LIKE :search", search: "%#{item}%")
        @alternatives += Alternative.where("lower(title) LIKE :search OR lower(description) LIKE :search", search: "%#{item}%")
      end

      if !@products.present? && !@alternatives.present?
      	nbOfProducts = Product.count
      	nbOfSuggestions = 3
      	@suggestions = Array.new(nbOfSuggestions)

      	@suggestions.map! do |suggestion|
      		suggestion = Product.find( rand(nbOfProducts))
      	end
      end

      @nbOfResults = @products.count + @alternatives.count
    end
	end
end