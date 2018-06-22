feature "booking requests for a user's listings will show up on 'mylistings' page" do
  scenario "a host can see requests made for their property" do
    # first person signs in and adds a listing
    sign_up
    add_listing
    visit "/listings/new"
    click_button "Sign out"
    # second person signs in and requests a booking
    visit '/'
    fill_in("name", with: "Rahul")
    fill_in("email", with: "rahul@mail.com")
    fill_in("password", with: "mimo")
    click_button("Submit")
    visit("/listings")
    click_button "Request apartment"
    visit "/listings/new"
    click_button "Sign out"
    # first person signs in and views their listings
    sign_in
    visit "/mylistings"
    expect(page).to have_content "rahul@mail.com"
  end
end
