defmodule WebsiteDoubanWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use WebsiteDoubanWeb, :html

  embed_templates "page_html/*"

  attr :rating, :integer

  def render_stars(assigns) do
    # IO.inspect(assigns.rating)
    score = assigns.rating

    # adjusted_rating = rating / 2
    full_stars = Kernel.trunc(score / 2)
    half_star = rem(Kernel.trunc(score * 10), 20) < 15
    empty_stars = 5 - full_stars - if(half_star, do: 1, else: 0)

    IO.inspect(full_stars)
    IO.inspect(half_star)
    IO.inspect(empty_stars)

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
