defmodule WebsiteDouban.Repo do
  use Ecto.Repo,
    otp_app: :website_douban,
    adapter: Ecto.Adapters.Postgres
  use Scrivener, page_size: 10
end
