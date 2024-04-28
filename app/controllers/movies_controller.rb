class MoviesController < ApplicationController
  def movie
    @all_movies = Movie.all
    @movies = {}
    @all_movies.each do |movie|
      @movies[movie] = Director.find(movie.director_id).name
    end
    render({ :template => "templates/all_movies" })
  end
  def movie_details
    @id_num = params.fetch("id_num").to_i
    @movie = Movie.find(@id_num)
    @director = Director.find(@movie.director_id).name
    render({ :template => "templates/movie_details" })
  end
end
