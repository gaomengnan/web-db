defmodule WebsiteDouban.Doubans.Douban do
  use Ecto.Schema
  import Ecto.Changeset

  schema "douban" do
    field(:rank, :integer)
    field(:score, :float)
    field(:comment_count, :integer)
    field(:cover, :string)
    field(:desc, :string)
    field(:title, :string)
    field(:url, :string)
    belongs_to(:resource, WebsiteDouban.Resource)
  end

  # 定义 changest
  def changeset(attrs, params \\ %{}) do
    attrs
    |> cast(params, [:title, :url, :rank, :score, :comment_count, :cover, :desc, :movie_id])
    |> validate_required([:title, :url, :rank, :score, :comment_count, :cover, :desc, :movie_id])
    |> foreign_key_constraint(:resource_id)
  end
end
