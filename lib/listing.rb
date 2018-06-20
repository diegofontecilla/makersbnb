require 'pg'

class Listing
  attr_reader :listing_id, :listing_title, :listing_owner, :listing_price, :listing_description, :listing_available_dates

  def initialize(listing_id, listing_title, listing_owner, listing_price, listing_description, listing_available_dates)
    @listing_id = listing_id
    @listing_title = listing_title
    @listing_owner = listing_owner
    @listing_price = listing_price
    @listing_description = listing_description
    @listing_available_dates = listing_available_dates
  end

  def self.create(title, owner, price, description, available_dates)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO apartments (title, owner, price, description, available_dates) VALUES ('#{title}', '#{owner}', '#{price}', '#{description}', '#{available_dates}') RETURNING *")
    Listing.new(result[0]['id'], result[0]['title'], result[0]['owner'], result[0]['price'], result[0]['description'], result[0]['available_dates'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM apartments")
    result.map { |listing| Listing.new(listing['id'], listing['title'], listing['owner'], listing['price'], listing['description'], listing['available_dates']) }
  end

end
