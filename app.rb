require 'sinatra/base'
require 'sinatra'

class MakersBnb < Sinatra::Base

	$listings = []

	get '/' do
		erb :index
	end
	
	post "/" do
		$listings << {title: params["title"], owner: params["owner"]}
		redirect "/"
	end
end
