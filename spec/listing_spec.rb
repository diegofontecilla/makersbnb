require 'listing'

describe Listing do
  describe 'adding and retrieving items from the database' do
    it 'creates a new listing' do
      Listing.create("Lovely flat in London", "Rahul")
      expect(Listing.all[0].listing_title).to eq("Lovely flat in London")
      expect(Listing.all[0].listing_owner).to eq("Rahul")
    end
  end
end
