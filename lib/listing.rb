require 'pg'

class Listing
  attr_reader :listing_id, :listing_title, :listing_owner, :listing_price, :listing_description

  def initialize(listing_id, listing_title, listing_owner, listing_price, listing_description)
    @listing_id = listing_id
    @listing_title = listing_title
    @listing_owner = listing_owner
    @listing_price = listing_price
    @listing_description = listing_description
  end

  def self.create(title, owner, price, description)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO apartments (title, owner, price, description) VALUES ('#{title}', '#{owner}', '#{price}', '#{description}') RETURNING *")
    Listing.new(result[0]['id'], result[0]['title'], result[0]['owner'], result[0]['price'], result[0]['description'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM apartments")
    result.map { |listing| Listing.new(listing['id'], listing['title'], listing['owner'], listing['price'], listing['description']) }
  end

end
