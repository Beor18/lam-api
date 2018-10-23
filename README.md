# LamApi

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### Rutas
```sh
POST    /api/users/sign_in  LamApiWeb.UserController :sign_in

GET     /api/productos      LamApiWeb.ProductoController :index
GET     /api/productos/:id  LamApiWeb.ProductoController :show
POST    /api/productos      LamApiWeb.ProductoController :create
PATCH   /api/productos/:id  LamApiWeb.ProductoController :update
PUT     /api/productos/:id  LamApiWeb.ProductoController :update
DELETE  /api/productos/:id  LamApiWeb.ProductoController :delete

```

