defmodule WebsiteDoubanWeb.PageController do
  use WebsiteDoubanWeb, :controller

  alias WebsiteDouban.Doubans

  def home(conn, params) do
    Doubans.list_douban_paginate(params)
    render(conn, :home, name: "ok")
  end
end
