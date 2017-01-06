class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:send_info]

  expose_decorated(:movies) { Movie.all }
  expose(:movie)

  def send_info
    MovieInfoMailerJob.perform_async(current_user, movie)
    redirect_to :back, notice: 'Email is being sent. You will be notified when it is done.'
  end

  def export
    file_path = 'tmp/movies.csv'
    MovieExportJob.perform_async(current_user, file_path)
    redirect_to root_path, notice: 'Movies are being exported. You will be notified when it is done.'
  end
end
