feature 'authentication' do
  it 'a user can sign in' do
    User.create(name: "diego", email: "diego@mail.com", password: "mimo")
    visit '/sessions/new'
    fill_in(:email, with: "diego@mail.com")
    fill_in(:password, with: "mimo")
    click_button('Sign in')
    expect(page).to have_content('Wellcome diego@mail.com')
  end
end
