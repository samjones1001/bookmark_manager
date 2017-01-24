require 'sinatra/base'
require_relative 'models/link'



class BookmarkManager < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

    get '/links/new' do
      erb :'links/new'
    end

    post '/links' do
      Link.create(:title => params[:title], :url => params[:url])
      redirect '/links'
    end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
