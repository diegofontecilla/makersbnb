feature 'registration' do
  scenario 'user can sign up' do
    sign_up
    expect(page).to have_content('Welcome, Diego!')
  end
end
