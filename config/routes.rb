Rails.application.routes.draw do
  # Routes for the Court resource:
  # CREATE
  get "/courts/new", :controller => "courts", :action => "new"
  post "/create_court", :controller => "courts", :action => "create"

  # READ
  get "/courts", :controller => "courts", :action => "index"
  get "/courts/:id", :controller => "courts", :action => "show"

  # UPDATE
  get "/courts/:id/edit", :controller => "courts", :action => "edit"
  post "/update_court/:id", :controller => "courts", :action => "update"

  # DELETE
  get "/delete_court/:id", :controller => "courts", :action => "destroy"
  #------------------------------

  # Routes for the Match resource:
  # CREATE
  get "/matches/new", :controller => "matches", :action => "new"
  post "/create_match", :controller => "matches", :action => "create"

  # READ
  get "/matches", :controller => "matches", :action => "index"
  get "/matches/:id", :controller => "matches", :action => "show"

  # UPDATE
  get "/matches/:id/edit", :controller => "matches", :action => "edit"
  post "/update_match/:id", :controller => "matches", :action => "update"

  # DELETE
  get "/delete_match/:id", :controller => "matches", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
