class Api::V2::MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: movies, each_serializer: MovieSerializerV2
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie, serializer: MovieSerializerV2
  end
end
