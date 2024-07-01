defmodule WebsiteDoubanWeb.UserLoginLive do
  use WebsiteDoubanWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="h-1/2 w-1/2 max-w-xl  rounded-xl">
      <.header class="text-center">
        登录
        <:subtitle>
          还没有账号?
          <.link navigate={~p"/users/register"} class="font-semibold text-brand hover:underline">
            注册
          </.link>
          账号.
        </:subtitle>
      </.header>

      <.simple_form for={@form} id="login_form" action={~p"/users/log_in"} phx-update="ignore">
        <.input field={@form[:email]} type="email" label="邮箱" required />
        <.input field={@form[:password]} type="password" label="密码" required />

        <:actions>
          <.input field={@form[:remember_me]} type="checkbox" label="保持登录" />
          <.link href={~p"/users/reset_password"} class="text-sm font-semibold">
            忘记密码?
          </.link>
        </:actions>
        <:actions>
          <.button phx-disable-with="Log in..." class="w-1/2 m-auto mb-5">
            登录
          </.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    email = Phoenix.Flash.get(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
