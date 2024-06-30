defmodule WebsiteDouban.Repo do
  use Ecto.Repo,
    otp_app: :website_douban,
    adapter: Ecto.Adapters.Postgres
end
