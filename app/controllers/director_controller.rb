class DirectorController < ApplicationController
  def all
    @directors = Director.all
    render({ :template => "templates/all_directors" })
  end
  def elder
    @oldest = Director.where.not(dob: nil).order(dob: :asc).first
    render({ :template => "templates/oldest_director" })
  end
  def younger
    @youngest = Director.order(dob: :desc).first
    render({ :template => "templates/youngest_director" })
  end
  def details
    @id_num = params.fetch("id_num").to_i
    @director = Director.find(@id_num)
    @all_movies = Movie.all
    @movies = []
    @all_movies.all.each do |movie|
      if movie.director_id == @id_num 
        @movies.push(movie)
      end
    end
    render({ :template => "templates/director_details" })
  end
end
