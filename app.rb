require 'sinatra/base'
require './app/models/link'

class BookmarkManager < Sinatra::Base
  get '/links' do
    # This uses DataMapper's .all method to fetch all
    # data pertaining to this class from the database
    @links = Link.all
    erb :'links/index'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
