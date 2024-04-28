class ActorsController < ApplicationController
  def actor
    @actors = Actor.all
    render({ :template => "templates/all_actors" })
  end
  def actor_details
    @id_num = params.fetch("id_num").to_i
    @actor = Actor.find(@id_num) 
    @characters = Character.where({ :actor_id => @id_num })
    @filmography = {}
    @characters.all.each do |character|
      @filmography[Movie.find(character.movie_id)] = [character.name, Director.find(Movie.find(character.movie_id).director_id)]
    end
    render({ :template => "templates/actor_details" })
  end
end
