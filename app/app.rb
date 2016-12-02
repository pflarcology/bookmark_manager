ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
      erb :'links/login'
  end

  post '/sign-in' do

  end
  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    @message = ''
    erb(:'links/new')
  end

  post '/links' do
    link = Link.new(url: params[:url],
                    title: params[:title])
    input_tags = params[:tag].split(',')
    input_tags.map{|tag| tag.strip!}
    input_tags.each do |t|
      tag = Tag.first_or_create(name: t)
      link.tags << tag
    end
    link.save
    redirect '/links'
  end

  get '/tags/:tag' do
    tag = Tag.first(name: params[:tag])
    @links = tag ? tag.links : []
    erb :'links/filtered_by_tag'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
