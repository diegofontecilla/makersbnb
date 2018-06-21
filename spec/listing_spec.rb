require 'user'
require 'listing'

describe Listing do

  let(:user) { user }

  before do
    user = User.create(name: "simone", email: "simone@mail.com", password: "mimo")
    Listing.create("Lovely flat in London", "5", "My flatmate is a zombie!", "2018-06-21", "2018-06-25", 1)
    expect(Listing.all.last.listing_title).to eq("Lovely flat in London")
  end

  it 'create and retrieve a new listing' do
    expect(Listing.all.last.listing_price).to eq("5")
    expect(Listing.all.last.listing_description).to eq("My flatmate is a zombie!")
    expect(Listing.all.last.listing_start_date).to eq("2018-06-21")
    expect(Listing.all.last.listing_end_date).to eq("2018-06-25")
    expect(Listing.all.last.listing_owner).to eq("simone")
  end

  it 'should return only signed-in user\'s listings' do
    # Listing.all_for_user(user.id)
    expect(user.id).to eq 1
    
  end


end
