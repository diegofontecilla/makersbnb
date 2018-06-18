require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup do
  # p "Creating databases..."

  ['makersbnb', 'makersbnb_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY, \
                    name VARCHAR(140), email VARCHAR(60), password VARCHAR(60));")
    connection.exec("CREATE TABLE apartments (id SERIAL PRIMARY KEY, \
                    title VARCHAR(140), name VARCHAR(60), users_id INTEGER REFERENCES users(id));")
  end
end

task :test_database_setup do

  # p "Cleaning database"

  connection = PG.connect(dbname: 'makersbnb_test')

  # Clear the databases
  connection.exec("TRUNCATE apartments, users;")
  connection.exec("ALTER SEQUENCE apartments_id_seq RESTART;")
  connection.exec("ALTER SEQUENCE users_id_seq RESTART;")

end

task :teardown do
  p "Destroying databases...type 'y' to confirm that you want to destroy \
  the Makersbnb databases. This will remove all data in those databases!"

  # Get a confirmation from the user!
  confirm = STDIN.gets.chomp
  return unless confirm == 'y'

  ['makersbnb', 'makersbnb_test'].each do |database|
    connection = PG.connect
    # Drop each database in the list
    connection.exec("DROP DATABASE #{database}")
  end

  task :say_hello do
    p "Hello World!"
  end
end
