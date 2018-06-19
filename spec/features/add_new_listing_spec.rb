feature 'adding new property to the list' do
  scenario 'add property' do
    visit '/'
    fill_in("title", with: "Lovely flat in London")
    fill_in("owner", with: "Rahul")
    click_button("Submit")
    expect(page).to have_content('Lovely flat in London')
    expect(page).to have_content('Rahul')
  end
end
