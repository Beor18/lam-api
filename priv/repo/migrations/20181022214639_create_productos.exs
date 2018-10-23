defmodule LamApi.Repo.Migrations.CreateProductos do
  use Ecto.Migration

  def change do
    create table(:productos) do
      add :titulo, :string
      add :descripcion, :string

      timestamps()
    end

  end
end
