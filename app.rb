require 'rubygems'
require 'sinatra/base'
require 'rspec'
require 'data_mapper'
require './models/link'



class BMM < Sinatra::Base
  get '/' do
    'Hello BMM!'
    redirect '/links'
  end

  get '/links' do
    p @link = Link.all
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
