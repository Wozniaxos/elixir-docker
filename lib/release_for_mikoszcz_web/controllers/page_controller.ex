defmodule ReleaseForMikoszczWeb.PageController do
  use ReleaseForMikoszczWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
