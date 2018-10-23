defmodule LamApiWeb.ProductoController do
  use LamApiWeb, :controller

  alias LamApi.Productos
  alias LamApi.Productos.Producto

  action_fallback LamApiWeb.FallbackController

  def index(conn, _params) do
    productos = Productos.list_productos()
    render(conn, "index.json", productos: productos)
  end

  def create(conn, %{"producto" => producto_params}) do
    with {:ok, %Producto{} = producto} <- Productos.create_producto(producto_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", producto_path(conn, :show, producto))
      |> render("show.json", producto: producto)
    end
  end

  def show(conn, %{"id" => id}) do
    producto = Productos.get_producto!(id)
    render(conn, "show.json", producto: producto)
  end

  def update(conn, %{"id" => id, "producto" => producto_params}) do
    producto = Productos.get_producto!(id)

    with {:ok, %Producto{} = producto} <- Productos.update_producto(producto, producto_params) do
      render(conn, "show.json", producto: producto)
    end
  end

  def delete(conn, %{"id" => id}) do
    producto = Productos.get_producto!(id)
    with {:ok, %Producto{}} <- Productos.delete_producto(producto) do
      send_resp(conn, :no_content, "")
    end
  end
end
