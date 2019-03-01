class SongsController < ApplicationController

  before_action :set_artist
  before_action :set_song, only: (:edit, :update, :destroy, :show)


  def index
    @song = @artist.songs
  end

  def new
    @songs = Song.new
  end

  def create
    @song = @artist.songs.new(somg_params)
    if @song.save
      redirect_to [@artist, @song]
    else
      render :new
    end
  end

  def edit
    render partial: 'songs/form'
  end

  def show
  end

  def update
    if song.update(song_params)
      redirect_to [@artist, @song]
    else
      render :edit
  end

  def delete
    @song.destroy
    redirect_to artists_songs_path
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name)
  end


end
