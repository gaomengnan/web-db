defmodule WebsiteDouban.DoubansFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WebsiteDouban.Doubans` context.
  """

  @doc """
  Generate a douban.
  """
  def douban_fixture(attrs \\ %{}) do
    {:ok, douban} =
      attrs
      |> Enum.into(%{

      })
      |> WebsiteDouban.Doubans.create_douban()

    douban
  end
end
