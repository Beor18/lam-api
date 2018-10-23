defmodule LamApiWeb.Router do
  use LamApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug(:fetch_session)
  end

  pipeline :api_auth do
    plug(:ensure_authenticated)
  end

  scope "/api", LamApiWeb do
    pipe_through([:api, :api_auth])
    resources "/users", UserController, except: [:new, :edit]
  end

   scope "/api", LamApiWeb do
    pipe_through(:api)
    resources("/users", UserController, except: [:new, :edit])
    post("/users/sign_in", UserController, :sign_in)
  end

  scope "/api", LamApiWeb do
    pipe_through :api
    resources "/productos", ProductoController, except: [:new, :edit]
  end

  defp ensure_authenticated(conn, _opts) do
    current_user_id = get_session(conn, :current_user_id)

    if current_user_id do
      conn
    else
      conn
      |> put_status(:unauthorized)
      |> render(LamApiWeb.ErrorView, "401.json", message: "Usuario no logeado!")
      |> halt()
    end
  end
end