defmodule Exwrap.MyPlug do
  import Plug.Conn

  def init(options) do
    # initialize options
    options
  end

  def call(conn, _opts) do
  	IO.puts "request..."
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello world")
  end
end