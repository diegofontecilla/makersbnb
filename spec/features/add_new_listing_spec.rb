feature 'adding new property to the list' do
  scenario 'add property' do
    visit '/'
    fill_in("name", with: "Some Name")
    fill_in("email", with: "someemail@email.com")
    fill_in("password", with: "test1234")
    click_button("Submit")
    visit '/listings/new'
    fill_in("title", with: "Lovely flat in London")
    fill_in("owner", with: "Rahul")
    fill_in("price", with: "1.23")
    fill_in("description", with: "Oh how I love this apartment!")
    click_button("Submit")
    expect(page).to have_content('Lovely flat in London')
    expect(page).to have_content('Rahul')
    expect(page).to have_content("1.23")
    expect(page).to have_content("Oh how I love this apartment!")
  end
end
