require 'sinatra/base'
require 'sinatra'
require_relative './lib/listing'

class MakersBnb < Sinatra::Base

	get '/' do
		@listings = Listing.all
		erb :index
	end

	post "/" do
		Listing.create(params["title"], params["owner"])
		redirect "/"
	end
end
