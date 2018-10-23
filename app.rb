require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  set :port, 5678

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:"bookmarks/index")
  end

  get '/new' do
    erb(:"bookmarks/new")
  end

  post '/bookmarks' do
    Bookmark.create(name: params[:Name], url: params[:URL])
    redirect '/bookmarks'
    # get bookmark object to add relevant thing!
  end

  run! if app_file == $0
end
