class Api::V1::MyApiController < ApplicationController
  def index
    movies = Movie.all
    render json: movies, each_serializer: MovieSerializerV1
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie, serializer: MovieSerializerV1
  end
end
