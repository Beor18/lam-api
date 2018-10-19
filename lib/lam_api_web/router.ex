defmodule LamApiWeb.Router do
  use LamApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug(:fetch_session)
  end

  scope "/api", LamApiWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
  end

   scope "/api", LamApiWeb do
    pipe_through(:api)
    resources("/users", UserController, except: [:new, :edit])
    post("/users/sign_in", UserController, :sign_in)
  end
end