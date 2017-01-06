class MovieDecorator < Draper::Decorator
  delegate_all

  def plot_overview
    movie_info.overview
  end

  def vote_average
    movie_info.vote_average
  end

  def cover
    'http://lorempixel.com/100/150/' + %W(abstract nightlife transport).sample + '?a=' + SecureRandom.uuid
  end

  def movie_poster
    movie_poster_path = movie_info.poster_path
    base_url = MovieDbApiClient.configuration.base_url
    size = MovieDbApiClient.configuration.poster_sizes.second

    base_url + size + movie_poster_path
  end

  private

  def movie_info
    MovieDbApiClient.instance.movie_details(title)
  end
end
