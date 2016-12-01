ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative './models/link.rb'
require_relative './models/tag.rb'
require 'pry'
require_relative './models/data_mapper_setup'

class BookmarksManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links/create' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:name].split.each do |name|
        link.tags << Tag.create(name: name)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:a' do
      tag = Tag.first(name: params[:a])
      @links = tag ? tag.links : []
      erb :'links/index'
  end
  #
  # # start the server if ruby file executed directly
  run! if app_file == $0
end
