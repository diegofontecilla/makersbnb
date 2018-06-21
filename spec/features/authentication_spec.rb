feature 'authentication' do

  it 'a user can sign in' do
    sign_up
    sign_in
    expect(page).to have_content('Welcome diego@mail.com')
  end

  it 'a user sees an error if they get their email wrong' do
    sign_up
    sign_in_wrong_email
    expect(page).not_to have_content("Welcome diego@mail.com")
    expect(page).to have_content('Please check your email or password')
  end

  it 'a user sees an error if they get their password wrong' do
    sign_up
    sign_in_wrong_password
    expect(page).not_to have_content("Welcome diego@mail.com")
    expect(page).to have_content('Please check your email or password')
  end

  it 'a user can sign out' do
    sign_up
    sign_in
    click_button('Sign out')

    expect(page).not_to have_content('Welcome diego@mail.com')
    expect(page).to have_content('You have signed out')
  end
end
