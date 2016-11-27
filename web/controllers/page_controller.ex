defmodule EventSourcing.PageController do
  use EventSourcing.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
