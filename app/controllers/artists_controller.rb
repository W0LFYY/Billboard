class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  def index
    @artists = Artist.order("name ASC")
  end

  def new
    @artist = Artist.new
    render partial: "form"
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def edit
    
  end
  def show
    
  end

  def update
    if @artist.update(artist_params)
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end


  private
    def set_artist
      @artist = Artist.find(params[:id])
    end
    def artist_params
      params.require(:artist).permit(:name, :image_src, :description)
    end
end
