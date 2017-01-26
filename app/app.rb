ENV['RACK_ENV'] ||= 'development'

require 'sinatra/flash'
require 'sinatra/base'
require_relative 'datamapper_setup'


class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, "secret"

  register Sinatra::Flash

  before do
    @current_user = current_user
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/links/new' do
    @current_user = current_user
    erb :'/links/new'
  end

  get '/user/new' do
    @user = User.new
    erb :'/user/new'
  end

  get '/' do
    @current_user = current_user
    redirect '/links'
  end

  get '/links' do
    @current_user = current_user
    @links = Link.all
    erb :'links/index'
  end

  post '/user' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'/user/new'
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
