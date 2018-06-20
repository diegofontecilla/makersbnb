def sign_up
  visit '/'
  fill_in("name", with: "Diego")
  fill_in("email", with: "diego@mail.com")
  fill_in("password", with: "mimo")
  click_button("Submit")
end

def sign_in
  visit '/sessions/new'
  fill_in(:email, with: "diego@mail.com")
  fill_in(:password, with: "mimo")
  click_button('Sign in')
end

def sign_in_wrong_email
  visit '/sessions/new'
  fill_in(:email, with: "simone@mail.com")
  fill_in(:password, with: "mimo")
  click_button('Sign in')
end

def sign_in_wrong_password
  visit '/sessions/new'
  fill_in(:email, with: "diego@mail.com")
  fill_in(:password, with: "toro")
  click_button('Sign in')
end

def add_listing
  visit '/listings/new'
  fill_in("title", with: "Lovely flat in London")
  fill_in("price", with: "1.23")
  fill_in("description", with: "Oh how I love this apartment!")
  fill_in("available_dates", with: "20180606-20180608")
  click_button("Submit")
end
