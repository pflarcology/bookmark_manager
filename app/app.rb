require 'sinatra/base'
require_relative './models/link.rb'

class BookmarksManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end



  get '/links/new' do
    erb :new


  end

  post '/links/create' do


  end
  #
  # # start the server if ruby file executed directly
  run! if app_file == $0
end
