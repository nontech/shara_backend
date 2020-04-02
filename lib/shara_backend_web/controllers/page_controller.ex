defmodule SharaBackendWeb.PageController do
  use SharaBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
