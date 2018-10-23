defmodule LamApi.Productos.Producto do
  use Ecto.Schema
  import Ecto.Changeset


  schema "productos" do
    field :descripcion, :string
    field :titulo, :string

    timestamps()
  end

  @doc false
  def changeset(producto, attrs) do
    producto
    |> cast(attrs, [:titulo, :descripcion])
    |> validate_required([:titulo, :descripcion])
  end
end
