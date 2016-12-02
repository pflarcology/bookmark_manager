ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra'
require 'sinatra/flash'
require 'pry'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/users/new' do
      @user = User.new
      erb :'links/login'
  end

  post '/sign_in' do
    @user = User.new(email: params[:email], password_method: params[:password],
    password_confirmation: params[:confirm_password])
    if @user.save
      session[:id] = @user.id
      redirect '/links'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'/links/login'
    end
  end

  helpers do
    def get_user_id
      @user ||= User.get(session[:id])
    end
  end


  get '/links' do
    @links = Link.all
    # get_user_id

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
