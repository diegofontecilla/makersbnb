require 'listing'

describe Listing do
  it 'create and retrieve a new listing' do
    Listing.create("Lovely flat in London", "Rahul", "1.23")
    expect(Listing.all[0].listing_title).to eq("Lovely flat in London")
    expect(Listing.all[0].listing_owner).to eq("Rahul")
    expect(Listing.all[0].listing_price).to eq("1.23")
  end
end
