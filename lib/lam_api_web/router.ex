defmodule LamApiWeb.Router do
  use LamApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LamApiWeb do
    pipe_through :api
  end
end
