require 'themoviedb'
require 'singleton'

class MovieDbApiClient
  include Singleton

  attr_reader :configuration

  def initialize
    Tmdb::Api.key(ENV['MOVEDB_API_KEY'])
    @configuration = Tmdb::Configuration.new
  end

  def movie_details(title)
    Tmdb::Movie.find(title).first
  end
end
