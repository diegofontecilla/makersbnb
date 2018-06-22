require 'user'
require 'listing'

describe Listing do

  it 'create and retrieve a new listing' do
    user = User.create(name: "simone", email: "simone@mail.com", password: "mimo")
    Listing.create("Lovely flat in London", "5", "My flatmate is a zombie!", "2018-06-21", "2018-06-25", 1)

    expect(Listing.all.last.listing_title).to eq("Lovely flat in London")
    expect(Listing.all.last.listing_price).to eq("5")
    expect(Listing.all.last.listing_description).to eq("My flatmate is a zombie!")
    expect(Listing.all.last.listing_start_date).to eq("2018-06-21")
    expect(Listing.all.last.listing_end_date).to eq("2018-06-25")
    expect(Listing.all.last.listing_owner).to eq("simone")
  end

  it 'should return only signed-in user\'s listings' do
    # Listing.all_for_user(user.id)
    user = User.create(name: "simone", email: "simone@mail.com", password: "mimo")
    user = User.create(name: "Rahul", email: "rahul@mail.com", password: "mimo")
    Listing.create("Lovely flat in London", "5", "My flatmate is a zombie!", "2018-06-21", "2018-06-25", 1)
    Listing.create("Horrible flat in London", "3", "My flatmate is a vampire!", "2018-06-21", "2018-06-25", 2)

    expect(Listing.my_listings(1).length).to eq(1)
  end


end
