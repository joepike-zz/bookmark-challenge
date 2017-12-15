ENV["RACK_ENV"] ||= "development"

require 'sinatra'
require 'sinatra/base'
require './app/models/link'
require './app/models/tag'
require 'pry'

require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  attr_reader :search_results

  enable :sessions

  get ('/') do
    redirect('/signup')
  end

  get '/signup' do
    erb(:signup)
  end

  get '/links' do
    @user_name = session[:user_name]
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    # @link.title = params[:title]
    # @link.url = params[:url]
    erb(:new_links)
  end

  post '/links' do
    @user_name = session[:user_name]
    if @user_name == nil
      session[:user_name] = params[:user_name]
      redirect '/links'
    else
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save

    User.create(email: params[:email], params[:password])

    redirect '/links'
  end
  end

  # post '/search' do
  #   # tag_name = params[:tag_search]
  #   # @search_results = []
  #   # @links = Link.all
  #   # @links.each do |link|
  #   #   link.tags.each do |tag|
  #   #     if tag.name == tag_name
  #   #       @search_results << link
  #   #     end
  #   #   end
  #   # end
  #   # @links = @search_results
  #   # redirect '/links'
  # end

  run if app_file == $0
end
