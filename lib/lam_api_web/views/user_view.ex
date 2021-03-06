defmodule LamApiWeb.UserView do
  use LamApiWeb, :view
  alias LamApiWeb.UserView


  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
       is_active: user. is_active}
  end

  def render("sign_in.json", %{user: user}) do
    %{
      data: %{
        user: %{
          id: user.id,
          email: user.email
        }
      }
    }
  end
end
