require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do

    erb :'songs/new'
  end


  post '/songs' do
    @song = Song.create(params[:songs])
    @artist = Artist.create(params[:artists])
    redirect '/songs/:slug'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/show'
  end


end
