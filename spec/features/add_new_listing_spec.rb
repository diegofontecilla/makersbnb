feature 'adding new property to the list' do
  scenario 'add property' do
    sign_up
    add_listing
    expect(page).to have_content('Lovely flat in London')
    expect(page).to have_content("1.23")
    expect(page).to have_content("Oh how I love this apartment!")
    expect(page).to have_content("2018-06-06")
    expect(page).to have_content("2018-06-08")

  end
end
