class SearchController < ApplicationController

	def index
    @params = params[:id].parameterize.split('-')
    @nbOfResults = 0
    searchItems = Array.new

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

    #fill array of each search word
    @params.each do |word|

      #search exact word in dico and add it to searchItems
      if word.in?(dico)
        searchItems.push(word)
      end

      #search similar word in dico and add it to searchItems
      spell_checker = DidYouMean::SpellChecker.new(dictionary: dico)
      if spell_checker.correct(word).present?
        dicoResult = spell_checker.correct(word).last
        searchItems.push(dicoResult)
      end

    end

    @params = searchItems

    #query the dico result
    if @params.present?
      @products = Array.new
      @alternatives = Array.new

      searchItems.each do |item|
        @products += Product.where("lower(title) LIKE :search", search: "%#{item}%")
        @alternatives += Alternative.where("lower(title) LIKE :search OR lower(description) LIKE :search", search: "%#{item}%")
      end

      def has_already?(array)
         h = (Thread.current[:_has_three_buffer] ||= Hash.new(0)).clear
         # h = Hash.new(0)
         array.each do |i|
            h[i] += 1
            return true if h[i] >= 2
         end
         false
      end

      if @products.empty? && @alternatives.empty?
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