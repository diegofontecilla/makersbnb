require 'pg'

class Listing
  @@listings_array = []

  attr_reader :listing_id, :listing_title, :listing_owner

  def initialize(listing_id, listing_title, listing_owner)
    @listing_id = listing_id
    @listing_title = listing_title
    @listing_owner = listing_owner
  end

  def self.create(title, owner)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("INSERT INTO apartments (title, owner) VALUES ('#{title}', '#{owner}')")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM apartments")
    result.map {|listing| Listing.new(listing['id'], listing['title'], listing['owner'])}
  end

end
