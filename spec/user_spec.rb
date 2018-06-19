require "user"

describe User do

  it "create and retrieve a new user" do
    User.create(name: "John Doe", email: "johndoe@abc.def", password: "test1234")

    all_usernames = User.all.map { |user| user.name }
    all_emails = User.all.map { |user| user.email }
    expect(all_usernames).to include "John Doe"
    expect(all_emails).to include "johndoe@abc.def"
  end

end