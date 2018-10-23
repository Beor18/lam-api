defmodule LamApiWeb.ProductoView do
  use LamApiWeb, :view
  alias LamApiWeb.ProductoView

  def render("index.json", %{productos: productos}) do
    %{data: render_many(productos, ProductoView, "producto.json")}
  end

  def render("show.json", %{producto: producto}) do
    %{data: render_one(producto, ProductoView, "producto.json")}
  end

  def render("producto.json", %{producto: producto}) do
    %{id: producto.id,
      titulo: producto.titulo,
      descripcion: producto.descripcion}
  end
end
