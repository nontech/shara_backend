defmodule SharaBackendWeb.Router do
  use SharaBackendWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :review_checks do
    plug :ensure_authenticated_user
    plug :ensure_user_owns_review
  end

  scope "/", SharaBackendWeb do
    pipe_through :browser

    get "/", PageController, :index
    # get "/hello", HelloController, :index
    # get "/hello/:messenger", HelloController, :show
    # resources "/users", UserController
    # resources "/posts", PostController 
    # resources "/users", UserController do
    #   resources "/posts", PostController
    # end
    # resources "/posts", PostController, only: [:index, :show]
    # resources "/comments", CommentController, except: [:delete]
    resources "/reviews", ReviewController
  end

  scope "/admin", SharaBackendWeb.Admin, as: :admin  do
    pipe_through :browser

    resources "/images",  ImageController
    resources "/reviews", ReviewController
    resources "/users",   UserController
  end

  scope "/reviews", SharaBackendWeb do
    pipe_through :review_checks
  
    resources "/", ReviewController
  end

  # Other scopes may use custom stacks.
  # scope "/api", SharaBackendWeb do
  #   pipe_through :api
  # end
end
