class Movie < ActiveRecord::Base

    def self.find_similar_movie(director)
      return Movie.where("director = ?", director)
    end
  end