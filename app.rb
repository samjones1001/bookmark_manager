require 'sinatra/base'

class BMM < Sinatra::Base
  get '/' do
    'Hello BMM!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
