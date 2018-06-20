feature 'authentication' do
  it 'a user can sign in' do
    User.create(name: "diego", email: "diego@mail.com", password: "mimo")
    visit '/sessions/new'
    fill_in(:email, with: "diego@mail.com")
    fill_in(:password, with: "mimo")
    click_button('Sign in')
    expect(page).to have_content('Welcome diego@mail.com')
  end

  it 'a user sees an error if they get their email wrong' do
    User.create(name: "diego", email: "diego@mail.com", password: "mimo")
    visit '/sessions/new'
    fill_in(:email, with: "simone@mail.com")
    fill_in(:password, with: "mimo")
    click_button('Sign in')
    expect(page).not_to have_content("Welcome diego@mail.com")
    expect(page).to have_content('Please check your email or password')
  end

    it 'a user sees an error if they get their password wrong' do
      User.create(name: "diego", email: "diego@mail.com", password: "mimo")
      visit '/sessions/new'
      fill_in(:email, with: "diego@mail.com")
      fill_in(:password, with: "toro")
      click_button('Sign in')
      expect(page).not_to have_content("Welcome diego@mail.com")
      expect(page).to have_content('Please check your email or password')
    end

    it 'a user can sign out' do
      User.create(name: "diego", email: "diego@mail.com", password: "mimo")
      visit '/sessions/new'
      fill_in(:email, with: "diego@mail.com")
      fill_in(:password, with: "mimo")
      click_button('Sign in')
      click_button('Sign out')

      expect(page).not_to have_content('Welcome diego@mail.com')
      expect(page).to have_content('You have signed out')
    end
end
