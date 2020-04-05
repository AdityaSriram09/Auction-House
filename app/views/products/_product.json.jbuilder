json.extract! product, :id, :name, :description, :start_bid, :deadline, :contact, :image, :current_bid, :current_bidder, :sold, :created_at, :updated_at
json.url product_url(product, format: :json)
