class User < ActiveRecord::Base

    # def self.find_similar_movie(director)
    #   return Use.where("director = ?", director)
    # end
    def self.set_user_id
      last_user_id = User.maximum(:user_id)
      return last_user_id.to_i + 1
    end

  end