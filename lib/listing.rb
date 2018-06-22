require 'pg'

class Listing
  attr_reader :listing_id, :listing_title, :listing_owner, :listing_price, :listing_description, :listing_start_date, :listing_end_date

  def initialize(listing_id, listing_title, listing_price, listing_description, listing_start_date, listing_end_date, user_id)
    @listing_id = listing_id
    @listing_title = listing_title
    @listing_owner = find_username_by_id(user_id)
    @listing_price = listing_price
    @listing_description = listing_description
    @listing_start_date = listing_start_date
    @listing_end_date = listing_end_date
  end

  def self.create(title, price, description, start_date, end_date, user_id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO apartments (title, price, description, start_date, end_date, user_id) VALUES ('#{title}', '#{price}', '#{description}', '#{start_date}', '#{end_date}', '#{user_id}') RETURNING *")
    Listing.new(result[0]['id'], result[0]['title'], result[0]['price'], result[0]['description'], result[0]['start_date'], result[0]['end_date'], result[0]['user_id'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM apartments")
    result.map { |listing| Listing.new(listing['id'], listing['title'], listing['price'], listing['description'], listing['start_date'], listing['end_date'], listing['user_id']) }
  end

  def self.my_listings(user_id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM apartments WHERE user_id = #{user_id}")
    result.map { |listing| Listing.new(listing['id'], listing['title'], listing['price'], listing['description'], listing['start_date'], listing['end_date'], listing['user_id']) }
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
