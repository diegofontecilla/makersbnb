feature "Making booking requests" do
  scenario "booking confirmation shows up on the page" do
    sign_up
    add_listing
    click_button("Request apartment")
    expect(page).to have_content("Your request has been made for Lovely flat in London")
  end
end
