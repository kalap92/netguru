class MovieExportJob
  include SuckerPunch::Job

  def perform(current_user, file_path)
    MovieExporter.new.call(current_user, file_path)
  end
end
