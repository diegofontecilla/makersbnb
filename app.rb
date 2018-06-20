require 'sinatra/base'
require 'sinatra'
require_relative './lib/listing'
require_relative './lib/user'

class MakersBnb < Sinatra::Base
	enable :sessions

	get '/' do
		erb :index
	end

	get "/listings" do
		@listings = Listing.all
		@user = User.all.select { |user| user.id == session["id"] }[0]
		erb :"/listings/index"
	end

	post "/listings" do
		user = User.create(name: params["name"], email: params["email"], password: params["password"])
		session[:id] = user.id
		redirect "/listings"
	end

	get "/listings/new" do
		erb :"/listings/new"
	end

	post "/listings/new" do
		Listing.create(params["title"], params["owner"], params["price"], params["description"], params["available_dates"])
		redirect "/listings"
	end

end
