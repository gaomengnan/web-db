defmodule WebsiteDouban.Resource do
  use Ecto.Schema
  import Ecto.Changeset

  schema "resources" do
    field :data, :string

    has_one :douban, WebsiteDouban.Doubans.Douban
  end

  @doc false
  def changeset(resource, attrs) do
    resource
    |> cast(attrs, [:data])
    |> validate_required([])
  end
end
