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
    link = Link.new(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(name: params[:name])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
      @link_tag = LinkTag.all
      @links = Link.all
      @tags = Tag.all
      link_id = 0
      tag_id = 0
      @printed_links = []
      @tags.each do |tag|
        tag_id = tag.id if tag.name == params[:name]
      end
      @link_tag.each do |link_tags|
        link_id = link_tags.link_id if link_tags.tag_id == tag_id
      end
      @links.each do |link|
        @printed_links << link.url if link_id == link.id
      end
      erb :tags
  end
  #
  # # start the server if ruby file executed directly
  run! if app_file == $0
end
