Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })
  get("/directors", { :controller => "director", :action => "all"})
  get("/directors/eldest", { :controller => "director", :action => "elder"})
  get("/directors/youngest", { :controller => "director", :action => "younger"})
  get("/directors/:id_num", { :controller => "director", :action => "details"})
  get("/movies", { :controller => "movies", :action => "movie"})
  get("/movies/:id_num", { :controller => "movies", :action => "movie_details"})
  get("/actors", { :controller => "actors", :action => "actor"})
  get("/actors/:id_num", { :controller => "actors", :action => "actor_details"})
end
