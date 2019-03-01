class ArtistsController < ApplicationController

  before_action :set_billboard
  before_action :set_artist, only: (:edit, :update, :destroy, :show)


  def index
    @artist = @billboard.artist
  end

  def show
  end

  def edit
    render partial: 'artists/form'
  end

  def update
    if @artist.update(artist_params)
      redirect to [@billboard, @artist]
    else
      render :new
    end
  end

  def create
    @artist = @billboard.artist.new(artist_params)
    if @artist.save
      rediret_to [@billboard, @artist]
    else
      render :new
    end
  end

  def new
    @artist = @billboard.artist.new
    render partial: 'artists/form'
  end

  def delete
    @artist.destroy
    redirect_to billboards_artists_path
  end
    
    private
    def set_billboard
      @billboard = Billboard.find(params[:billboard_id])
    end

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artists_params
      params.require(:artist).permist(:name)
    end

end
