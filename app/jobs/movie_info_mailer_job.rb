class MovieInfoMailerJob
  include SuckerPunch::Job

  def perform(current_user, movie)
    MovieInfoMailer.send_info(current_user, movie).deliver_now
  end
end
