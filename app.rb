require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra'
require_relative './lib/listing'
require_relative './lib/user'
require_relative './lib/date_parser'

class MakersBnb < Sinatra::Base
	register Sinatra::Flash
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
		@dates = DateParser.to_str(
			DateParser.parse( params["available_dates"] )
		)
		Listing.create(params["title"], params["owner"], params["price"], params["description"], @dates)
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
		else
			flash[:notice] = "Please check your email or password"
			redirect '/sessions/new'
		end
	end

	post '/sessions/destroy' do
		session.clear
		flash[:notice] = 'You have signed out'
		redirect '/sessions/new'
	end

end
