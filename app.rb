ENV['RACK_ENV'] ||= 'development'

require 'sinatra/flash'
require 'sinatra/base'
require_relative './app/datamapper_setup.rb'


class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, "secret"
  
  register Sinatra::Flash

  get '/tags/:name' do
    @current_user = current_user
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links'
  end

  get '/new' do
    @current_user = current_user
    erb :new
  end

  get '/register' do
    erb :sign_up
  end

  get '/' do
    @current_user = current_user
    redirect 'links'
  end

  get '/links' do
    @current_user = current_user
    @links = Link.all
    erb :links
  end

  post '/user' do
    user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.valid?
      session[:user_id] = user.id
      redirect 'links'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      redirect  '/register'
    end
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


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
