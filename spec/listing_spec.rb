require 'listing'

describe Listing do
  it 'create and retrieve a new listing' do
    User.create(name: "simone", email: "simone@mail.com", password: "mimo")
    Listing.create("Lovely flat in London", "5", "My flatmate is a zombie!", "2018-06-21", "2018-06-25", 1)
    expect(Listing.all.last.listing_title).to eq("Lovely flat in London")
    expect(Listing.all.last.listing_price).to eq("5")
    expect(Listing.all.last.listing_description).to eq("My flatmate is a zombie!")
    expect(Listing.all.last.listing_start_date).to eq("2018-06-21")
    expect(Listing.all.last.listing_end_date).to eq("2018-06-25")
    expect(Listing.all.last.listing_owner).to eq("simone")
  end
end
