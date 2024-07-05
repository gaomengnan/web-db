defmodule WebsiteDoubanWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use WebsiteDoubanWeb, :html

  embed_templates "page_html/*"

  attr :rating, :integer

  attr :page_number, :integer
  attr :total_pages, :integer

  def render_pagination(assigns) do
    IO.inspect(assigns.page_number)
    IO.inspect(assigns.total_pages)

    # 1 2 3
    # cond do
    #   assigns.page_number == 1 do
    #
    #   end
    # end

    ~H"""
    <div class="flex gap-1 justify-end mt-10 text-white">
      <button class="text-black mr-3">上一页</button>

      <button class="bg-blue-400 h-10 px-5 rounded">
        1
      </button>
      <button class="bg-black h-10 px-5 rounded">
        2
      </button>
      <button class="bg-black h-10 px-5 rounded">
        3
      </button>
      <button class="text-black ml-3">下一页</button>
    </div>
    """
  end

  def render_stars(assigns) do
    # IO.inspect(assigns.rating)
    score = assigns.rating

    # adjusted_rating = rating / 2
    full_stars = Kernel.trunc(score / 2)
    half_star = rem(Kernel.trunc(score * 10), 20) < 15
    empty_stars = 5 - full_stars - if(half_star, do: 1, else: 0)
    assigns = assign(assigns, :full, full_stars)
    assigns = assign(assigns, :half, half_star)
    assigns = assign(assigns, :empty, empty_stars)

    # full_stars = floor(adjusted_rating)
    # half_star = rem(floor(rating * 10) - full_stars * 20, 20) >= 10
    # empty_stars = 5 - full_stars - if half_star, do: 1, else: 0
    #
    ~H"""
    <%= for _ <- 1..@full do %>
      <i class="fa fa-star text-yellow-400"></i>
    <% end %>

    <%= if @half do %>
      <i class="fa fa-star-half-alt text-yellow-400"></i>
    <% end %>

    <%= for _ <- 1..@empty do %>
      <i class="fa fa-star-o text-yellow-400"></i>
    <% end %>
    """
  end
end
