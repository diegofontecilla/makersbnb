require 'listing'

describe Listing do
  it 'create and retrieve a new listing' do
    Listing.create("Lovely flat in London", "Rahul", "5", "My flatmate is a zombie!", "01/01/01")
    expect(Listing.all[-1].listing_title).to eq("Lovely flat in London")
    expect(Listing.all[-1].listing_owner).to eq("Rahul")
    expect(Listing.all[-1].listing_price).to eq("5")
    expect(Listing.all[-1].listing_description).to eq("My flatmate is a zombie!")
    expect(Listing.all[-1].listing_available_dates).to eq("01/01/01")
  end
end
