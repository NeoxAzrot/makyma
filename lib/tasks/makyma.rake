namespace :makyma do
  desc "Data import"
  task import: :environment do

    puts "fill alternative type filter with online, diy and local"
    AlternativeTypeFilter.create( title: 'en ligne')
    AlternativeTypeFilter.create( title: 'DIY')
    AlternativeTypeFilter.create( title: 'Local')

    puts "add online, diy and local to alternativeTypeFilter"
    {
        hygiene: ['Hygiène', 'bottle.png', 'Trouve les alternatives vertes, durables et écoresponsables à tes produits de beauté ! Makyma te conseille les alternatives qui prennent tout autant soin de ta peau que de la planète. La seule hygiène qui vaille, c’est celle qui dure ! 🧴'],
        electronique: ['Électronique', 'plug.png', 'Déniche les alternatives vertes, durables et écoresponsables aux produits électroniques habituels ! Makyma te mets au courant des alternatives que te permettent de rester autant connecter à internet qu’à la planète. Réveille le geek-écolo qui sommeille en toi ! 💻'],
        maison: ['Maison', 'house.png', 'Remplace les objets de ton quotidien par des alternatives vertes, durables et écoresponsables ! Makyma te donne toutes les clefs pour devenir le maître ton foyer. On te sert des solutions sur un plateau, c’est du tout cuit ! 🍽'],
        exterieur: ['Extérieur', 'herb.png', 'Découvre les alternatives vertes, durables et écoresponsables aux produits de jardinage habituel ! Makyma te présente les alternatives qui s’occupent autant de tes plantes vertes que de la planète bleue. Prend l’air vert ! 🌿'],
        entretien: ['Entretien', 'broom.png', 'Change tes produits et objets d’entretien par les alternatives vertes, durables et écoresponsables qui te plaisent ! Makyma te propose les alternatives pour une maison propre sans salir notre planète. Des produits durables pour un entretien d’enfer ! 🧽'],
    }.each do |file, cat|
        puts "Import #{cat}"
        path = "vendor/data/#{file}.csv"
        category = Category.where(title: cat[0], description: cat[2], image: cat[1]).first_or_create
        require 'csv'
        CSV.foreach(path, headers: true) do |row|
            product_title = row[2]
            next if product_title.blank?
            product = Product.where(category: category, title: product_title).first_or_create
            alternative_title = row[3]
            alternative_description = row[4]
            next if alternative_title.blank?
            alternative = Alternative.where(product: product, title: alternative_title, description: alternative_description).first_or_create
            #alternative.description = row[4]
            alternative.find = row[5]
            alternative.source = row[6]
            #alternative.alternative_type_filter_id = 5
            alternative.imgUrl = ""
            if alternative.valid?
              alternative.save
              puts "  #{product} -> #{alternative}"
            else 
              puts "ERROR #{product} -> #{alternative}"
            end
        end
    end
  end
end
