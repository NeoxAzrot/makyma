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


    #query the dico result
    if @params.present?
      @products = Array.new
      @alternatives = Array.new

      searchItems.each do |item|
        @products += Product.where("lower(title) LIKE :search", search: "%#{item}%")
        @alternatives += Alternative.where("lower(title) LIKE :search OR lower(description) LIKE :search", search: "%#{item}%")
      end

      @products = drop_duplicates(@products)
      @alternatives = drop_duplicates(@alternatives)
      puts (@alternatives)
      #drop_duplicates(@alternatives)

      @nbOfResults = @products.count + @alternatives.count
    end

    #create suggestions
    if @products.empty? && @alternatives.empty?
      nbOfProducts = Product.count
      nbOfSuggestions = 3
      @suggestions = Array.new(nbOfSuggestions)

      @suggestions.map! do |suggestion|
        #suggestion = Product.find( rand(nbOfProducts))
        suggestion = Product.order("id").offset(rand(nbOfProducts)).first
      end
    end
	end

  #utils
  def drop_duplicates(array)
     #h = (Thread.current[:_has_three_buffer] ||= Hash.new(0)).clear
    h = Array.new(0)
    array.each do |i|
      if !i.in?(h)
        h.push(i)
      end
    end
    return h
  end

end