defmodule Discuss.Router do
  use Discuss.Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", Discuss do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  scope "/topics", Discuss do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", TopicController, :index)
    get("/:id/edit", TopicController, :edit)
    get("/new", TopicController, :new)
    post("/", TopicController, :create)
    put("/:id", TopicController, :update)
    delete("/:id/delete", TopicController, :delete)
  end

  # Other scopes may use custom stacks.
  # scope "/api", Discuss do
  #   pipe_through :api
  # end
end
