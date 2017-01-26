ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './app/datamapper_setup.rb'


class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, "secret"

  get '/' do
    redirect 'links'
  end

  get '/links' do
    @current_user = session[:current_user]
    @current_user_email = @current_user.email unless @current_user.nil?
  	@links = Link.all
  	erb :links
  end

  post '/user' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect 'links'
  end

  post '/links' do
  	link = Link.new(url: params[:url], title: params[:title])
    tags = params[:tags].split(",")
    tags.each do |single_tag|
      tag  = Tag.first_or_create(name: single_tag.strip)
      link.tags << tag
    end
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

  get '/register' do
    erb :sign_up
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
