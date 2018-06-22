require "request"
require "user"
require "listing"

describe Request do
  it "create and retrieve a new request" do
    user = User.create(name: "simone", email: "simone@mail.com", password: "mimo")
    booker = User.create(name: "rahul", email: "rahul@mail.com", password: "mimo")
    listing = Listing.create("Lovely flat in London", "5", "My flatmate is a zombie!", "2018-06-21", "2018-06-25", 1)
    Request.create(listing_id: listing.listing_id, booker_id: booker.id)
    expect(Request
      .made_to_host(host_id: "1")
      .last
      .requested_by
    ).to include "rahul@mail.com"
  end
end
