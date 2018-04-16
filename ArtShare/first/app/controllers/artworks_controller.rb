class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all

    if @artworks
      render json: @artworks
    else
      render json: @artworks.errors.full_messages, status: 404
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    if @artwork
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end
  end

  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @artwork = Artwork.find(params[:id])

    if @artwork.update(artwork_params)
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])

    if @artwork.destroy
      render json: @artwork
    else
      render plain: 'No bye bye'
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
