ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './app/datamapper_setup.rb'


class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/links'
  end

  get '/links' do
  	@links = Link.all
  	erb :links
  end

  post '/links' do
  	link = Link.new(url: params[:url], title: params[:title])
    tag  = Tag.first_or_create(name: params[:tags])
    link.tags << tag 
    link.save  
  	redirect 'links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links'
  end

  get '/new' do
  	erb :new
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
