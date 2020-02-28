namespace :makyma do
  desc "Data import"
  task import: :environment do
    {
        hygiene: 'Hygiène',
        electromenager: 'Électroménager',
        maison: 'Maison',
        exterieur: 'Exterieur',
        entretien: 'Entretien'
    }.each do |file, title|
        puts "Import #{title}"
        path = "vendor/data/#{file}.csv"
        category = Category.where(title: title).first_or_create
        require 'csv'
        CSV.foreach(path, headers: true) do |row|
            product_title = row[2]
            next if product_title.blank?
            product = Product.where(category: category, title: product_title).first_or_create
            alternative_title = row[3]
            next if alternative_title.blank?
            alternative = Alternative.where(product: product, title: alternative_title).first_or_create
            alternative.description = row[4]
            alternative.source = row[5]
            alternative.save
            puts "  #{product} -> #{alternative}"
        end
    end
  end
end
