namespace :makyma do
  desc "Data import"
  task import: :environment do
    {
        hygiene: 'Hygiène',
        electromenager: 'Électroménager',
        ustensiles: 'Ustensiles',
        jardin: 'Jardin',
        entretien: 'Entretien'
    }.each do |file, title|
        puts "Import #{title}"
        path = "vendor/data/#{file}.csv"
        category = Category.where(title: title).first_or_create
        require 'csv'
        CSV.foreach(path, headers: true) do |row|
            product_title = row[0]
            next if product_title.blank?
            product = Product.where(category: category, title: product_title).first_or_create
            alternative_title = row[1]
            next if alternative_title.blank?
            alternative = Alternative.where(product: product, title: alternative_title).first_or_create
            alternative.description = row[2]
            alternative.source = row[3]
            alternative.save
            puts "  #{product} -> #{alternative}"
        end
    end
  end
end
