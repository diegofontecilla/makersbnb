require 'gmail'

# Set up delivery defaults to use Gmail
Mail.defaults do
  delivery_method :smtp, {
    :address => 'smtp.gmail.com',
    :port => '587',
    :user_name => 'thewittymonkeys@gmail.com',
    :password => 'WittyMonkeys',
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end

# Send email with attachment.
mail = Mail.new do
  from     'thewittymonkeys@gmail.com'
  to       'simonecaplin@gmail.com'
  subject  'Hi, Simone!'
  #add_file :filename => 'hello_world.txt',
# :content => File.read('hello_world.txt')

end

# Don't forget delivery
# mail.deliver!
