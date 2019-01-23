defmodule Discuss.Router do
  use Discuss.Web, :router

  pipeline :browser do
    # incoming request ensures its an html request
    plug :accepts, ["html"]
    # see if it has a session
    plug :fetch_session
    plug :fetch_flash
    # do a security check
    plug :protect_from_forgery
    # put on http headers for a browser
    plug :put_secure_browser_headers
    plug Discuss.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Discuss do
    pipe_through :browser # Use the default browser stack

    resources "/", TopicController
  end

  scope "/auth", Discuss do
    pipe_through :browser

    get "/signout", AuthController, :signout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", Discuss do
  #   pipe_through :api
  # end
end
