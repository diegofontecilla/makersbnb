feature 'Viewing own listings' do
  scenario "user's own listings show up on the page" do
    sign_up
    add_listing
    visit('/mylistings')
    expect(page).to have_content ("Lovely flat in London")
  end

  scenario "other users' listings do not show up" do
    sign_up
    add_listing
    visit("/listings/new")
    click_button("Sign out")
    visit '/'
    fill_in("name", with: "Rahul")
    fill_in("email", with: "rahul@mail.com")
    fill_in("password", with: "mimo")
    click_button("Submit")
    visit '/listings/new'
    fill_in("title", with: "Horrible flat in London")
    fill_in("price", with: "3.23")
    fill_in("description", with: "Oh how I hate this apartment!")
    fill_in("start_date", with: "2018-06-06")
    fill_in("end_date", with: "2018-06-08")
    click_button("Submit")
    visit('/mylistings')
    expect(page).not_to have_content("Lovely flat in London")
  end
end
