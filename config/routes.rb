Rails.application.routes.draw do
  resources "posts"
  resources "sessions"
  resources "users"

  get "/login", :controller => "sessions", :action => "new"
  get "/logout", :controller => "sessions", :action => "destroy"

  # TODO: map landing page (aka root route) to controller and action
  # get "/", :controller => "", :action => ""
end
