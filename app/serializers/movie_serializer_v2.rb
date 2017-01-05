class MovieSerializerV2 < ActiveModel::Serializer
  attributes :id, :title, :genre_id, :genre_name, :genre_movies_count

  def genre_name
    Genre.find(@object.genre_id).name
  end

  def genre_movies_count
    Movie.where(genre_id: @object.genre_id).count
  end
end
