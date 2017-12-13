
require 'sinatra'
require 'sinatra/base'
require './app/models/link'

require_relative 'data_mapper_setup'

ENV["RACK_ENV"] ||= "development"

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    # @link.title = params[:title]
    # @link.url = params[:url]
    erb(:new_links)
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tag])
    link.tags << tag
    p link.tags
    link.save
    redirect '/links'
  end

  run if app_file == $0
end
