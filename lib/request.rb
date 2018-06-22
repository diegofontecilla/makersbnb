require "pg"

class Request
  attr_reader :id, :listing_id, :booker_id

  def initialize(id:, listing_id:, booker_id:)
    @id = id
    @listing_id = listing_id
    @booker_id = booker_id
  end

  def self.create(listing_id:, booker_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO requests (listing_id, booker_id) VALUES ('#{listing_id}', '#{booker_id}') RETURNING *")
    Request.new(
      id: result[0]['id'],
      listing_id: result[0]['listing_id'],
      booker_id: result[0]['booker_id']
    )
  end

  def self.made_to_host(host_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    all_requests = connection
      .exec("SELECT * FROM requests")
    all_requests = all_requests.map { |request|
        Request.new(
          id: all_requests[0]['id'],
          listing_id: all_requests[0]['listing_id'],
          booker_id: all_requests[0]['booker_id']
        )
      }

    my_listings = Listing.my_listings(host_id)

    all_requests.each { |request|
      my_listings.each { |listing|
        if listing.listing_id == request.listing_id
          listing.push_to_requested_by(
            User.find(request.booker_id).email
          )
        end
      }
    }

    my_listings
  end
end
