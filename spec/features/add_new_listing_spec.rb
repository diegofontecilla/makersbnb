feature 'adding new property to the list' do
  scenario 'add property' do
    visit '/listings/new'
    fill_in("title", with: "Lovely flat in London")
    fill_in("owner", with: "Rahul")
    fill_in("price", with: "1.23")
    click_button("Submit")
    expect(page).to have_content('Lovely flat in London')
    expect(page).to have_content('Rahul')
    expect(page).to have_content("1.23")
  end
end
