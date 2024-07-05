defmodule WebsiteDouban.Doubans do
  @moduledoc """
  The Doubans context.
  """

  import Ecto.Query, warn: false
  alias WebsiteDouban.Repo

  alias WebsiteDouban.Doubans.Douban

  @doc """
  Returns the list of douban.

  ## Examples

  iex> list_douban_paginate()
  [%Scrivener.Page{}]

  """
  def list_douban_paginate(params \\ %{}) do
    defaults = %{"page" => 1, "page_size" => 20}
    params = Map.merge(defaults, params)

    Douban
    |> order_by(asc: :rank)
    |> preload(:resource)
    |> Repo.paginate(params)
  end

  @doc """
  Returns the list of douban.

  ## Examples

      iex> list_douban()
      [%Douban{}, ...]

  """
  def list_douban do
    Repo.all(Douban)
  end

  @doc """
  Gets a single douban.

  Raises `Ecto.NoResultsError` if the Douban does not exist.

  ## Examples

      iex> get_douban!(123)
      %Douban{}

      iex> get_douban!(456)
      ** (Ecto.NoResultsError)

  """
  def get_douban!(id), do: Repo.get!(Douban, id)

  @doc """
  Creates a douban.

  ## Examples

      iex> create_douban(%{field: value})
      {:ok, %Douban{}}

      iex> create_douban(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_douban(attrs \\ %{}) do
    %Douban{}
    |> Douban.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a douban.

  ## Examples

      iex> update_douban(douban, %{field: new_value})
      {:ok, %Douban{}}

      iex> update_douban(douban, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_douban(%Douban{} = douban, attrs) do
    douban
    |> Douban.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a douban.

  ## Examples

      iex> delete_douban(douban)
      {:ok, %Douban{}}

      iex> delete_douban(douban)
      {:error, %Ecto.Changeset{}}

  """
  def delete_douban(%Douban{} = douban) do
    Repo.delete(douban)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking douban changes.

  ## Examples

      iex> change_douban(douban)
      %Ecto.Changeset{data: %Douban{}}

  """
  def change_douban(%Douban{} = douban, attrs \\ %{}) do
    Douban.changeset(douban, attrs)
  end
end
