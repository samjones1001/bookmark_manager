require 'sinatra/base'
require './models/link'


class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/links'
  end

  get '/links' do
  	@links = Link.all
  	erb :links
  end

  post '/links' do
  	Link.create(url: params[:url], title: params[:title])
  	redirect 'links'
  end

  get '/new' do
  	erb :new
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
