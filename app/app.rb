ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative './models/link.rb'
require_relative './models/tag.rb'
require 'pry'
require_relative './models/data_mapper_setup'

class BookmarksManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links/create' do
    link = Link.new(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(name: params[:name])
    link.tags << tag
    link.save
    redirect '/links'
  end
  #
  # # start the server if ruby file executed directly
  run! if app_file == $0
end
