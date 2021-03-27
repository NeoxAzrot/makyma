# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.makyma.org"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  # Add pages
  add '/categories', :changefreq => 'always', :priority => 1, :host => "https://www.makyma.org"
  add '/contact', :changefreq => 'weekly', :host => "https://www.makyma.org"
  add '/suggestion', :changefreq => 'weekly', :priority => 0.7, :host => "https://www.makyma.org"
  add '/about', :changefreq => 'weekly', :host => "https://www.makyma.org"
  add '/cgu', :changefreq => 'monthly', :host => "https://www.makyma.org"
  add '/presse', :changefreq => 'yearly', :host => "https://www.makyma.org"

  # Add categories
  Category.find_each do |category|
    add category_path(category), :lastmod => category.updated_at, :changefreq => 'weekly', :priority => 0.8, :host => "https://www.makyma.org"
  end

  # Add products
  Product.find_each do |product|
    add product_path(product), :lastmod => product.updated_at, :changefreq => 'weekly', :priority => 0.9, :host => "https://www.makyma.org"
  end

  # Add alternatives
  Alternative.find_each do |alternative|
    add alternative_path(alternative), :lastmod => alternative.updated_at, :changefreq => 'weekly', :priority => 0.9, :host => "https://www.makyma.org"
  end
end
