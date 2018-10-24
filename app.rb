require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require 'uri'

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

  get '/new' do
    erb(:"bookmarks/new")
  end

  post '/bookmarks' do
    if params[:URL] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(name: params[:Name], url: params[:URL])
    else
      flash[:notice] = "Please enter a valid URL."
    end
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

  run! if app_file == $0
end
