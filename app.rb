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
		@user = User.find(session[:id])
		erb :"/listings/new"
	end

	post "/listings/new" do
		Listing.create(params["title"], params["owner"], params["price"], params["description"])
		redirect "/listings"
	end

	get '/sessions/new' do
		erb :"sessions/new"
	end

	post '/sessions' do
		user = User.authenticate(email: params['email'], password: params['password'])
		if user
			session[:id] = user.id
			redirect '/listings/new'
		end
	end

end
