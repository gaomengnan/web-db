defmodule WebsiteDoubanWeb.PageController do
  use WebsiteDoubanWeb, :controller

  alias WebsiteDouban.Doubans

  def home(conn, params) do
    page = Doubans.list_douban_paginate(params)
    render(conn, :home, data: page.entries, page: page)
  end
end
