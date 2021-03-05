json.extract! product, :id, :category_id, :title, :created_at, :updated_at
json.url product_url(product, format: :json)
