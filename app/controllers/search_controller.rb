class SearchController < ApplicationController

	def index
    @search = params[:id]
    @params = @search.parameterize.split('-')
    @nbOfResults = 0
    searchItems = Array.new

    # TO SPEED UP THE SEARCH, THE DICO CAN BE STORE IN A DB INSTEAD OF RECREATE IT ANY TIME
    # FOR SORT RESULTS : multiples dico (title, descriptions, ...)
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
      findResult = false

      #search exact param word in dico and add it to searchItems
      if word.in?(dico)
        searchItems.push(word)
        findResult = true
      end
      
      #search similar word in dico and add it to searchItems
      spell_checker = DidYouMean::SpellChecker.new(dictionary: dico)
      if spell_checker.correct(word).present?
        dicoResult = spell_checker.correct(word).last
        searchItems.push(dicoResult)
        findResult = true
      end

      puts (findResult)
      
      #search if dico contain substring  
      if word.length > 2 
        dico.each do |dicoEntry|
          if dicoEntry.include?(word)
            searchItems.push(word)
          end
        end    
      end
    end

    @products = Array.new
    @alternatives = Array.new

    #query the dico result
    if @params.present?

      searchItems.each do |item|
        @products += Product.where("lower(unaccent(title)) LIKE :search", search: "%#{item}%")
        @alternatives += Alternative.where("lower(unaccent(title)) LIKE :search OR lower(unaccent(description)) LIKE :search", search: "%#{item}%")
      end

      # keep only one element for same word
      @products = drop_duplicates(@products)
      @alternatives = drop_duplicates(@alternatives)
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