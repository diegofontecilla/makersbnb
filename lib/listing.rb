require 'pg'

class Listing
  attr_reader :listing_id, :listing_title, :listing_owner, :listing_price, :listing_description, :listing_available_dates

  def initialize(listing_id, listing_title, listing_price, listing_description, listing_available_dates, user_id)
    @listing_id = listing_id
    @listing_title = listing_title
    @listing_owner = find_username_by_id(user_id)
    @listing_price = listing_price
    @listing_description = listing_description
    @listing_available_dates = listing_available_dates
  end

  def self.create(title, price, description, available_dates, user_id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO apartments (title, price, description, available_dates, user_id) VALUES ('#{title}', '#{price}', '#{description}', '#{available_dates}', '#{user_id}') RETURNING *")
    Listing.new(result[0]['id'], result[0]['title'], result[0]['price'], result[0]['description'], result[0]['available_dates'], result[0]['user_id'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM apartments")
    result.map { |listing| Listing.new(listing['id'], listing['title'], listing['price'], listing['description'], listing['available_dates'], listing['user_id']) }
  end

  private

  def find_username_by_id(user_id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM users WHERE id = #{user_id}")
    result[0]['name']
  end
end
