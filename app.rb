require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require 'pry'
require_relative "./database_connection_setup"

class BookmarkManager < Sinatra::Base
  set :port, 5678
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:"bookmarks/index")
  end

  get '/bookmarks/new' do
    erb(:"bookmarks/new")
  end

  post '/bookmarks' do
    flash[:notice] = "Please enter a valid URL." unless Bookmark.create(name: params[:Name], url: params[:URL])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(params[:id])
    erb(:"bookmarks/edit")
  end

  patch '/bookmarks/:id' do
    Bookmark.update(params[:id], params[:Name], params[:URL])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark = Bookmark.find(params[:id])
    erb(:"comments/new")
  end

  post '/bookmarks/:id/comments' do
    Comment.create(bookmark_id: params[:id], text: params[:comment])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
