require 'sinatra/base'
require 'sinatra'
require_relative './lib/listing'
require_relative './lib/user'

class MakersBnb < Sinatra::Base
	enable :sessions

	get '/' do
		@listings = Listing.all
		erb :index
	end

	post "/" do
		Listing.create(params["title"], params["owner"])
		redirect "/"
	end

	get "/signup" do
		erb :signup
	end

	post "/signup" do
		user = User.create(name: params["name"], email: params["email"], password: params["password"])
		session[:id] = user.id
		redirect "signup_successful"
	end

	get "/signup_successful" do
		@user = User.all.select { |user| user.id == session["id"] }[0]
		puts @user
		erb :signup_successful
	end
end
