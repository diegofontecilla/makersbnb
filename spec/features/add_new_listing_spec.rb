feature 'adding new property to the list' do
  scenario 'add property' do
    visit '/'
    fill_in("title", with: "nice apartment in shoreditch")
    fill_in("owner", with: "Diego")
    click_button("Submit")
    expect(page).to have_content('nice apartment in shoreditch')
    expect(page).to have_content('Diego')
  end
end
  