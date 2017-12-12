
require 'sinatra'
require 'sinatra/base'
require './app/models/link'

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
    @links = Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  run if app_file == $0
end
