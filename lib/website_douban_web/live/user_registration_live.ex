defmodule WebsiteDoubanWeb.UserRegistrationLive do
  use WebsiteDoubanWeb, :live_view

  alias WebsiteDouban.Accounts
  alias WebsiteDouban.Accounts.User

  def render(assigns) do
    ~H"""
    <div class="h-1/2 w-1/2 max-w-xl  rounded-xl">
      <.header class="text-center">
        注册
        <:subtitle>
          已经有账号?
          <.link navigate={~p"/users/log_in"} class="font-semibold text-brand hover:underline">
            登录
          </.link>
          你的账号现在.
        </:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="registration_form"
        phx-submit="save"
        phx-change="validate"
        phx-trigger-action={@trigger_submit}
        action={~p"/users/log_in?_action=registered"}
        method="post"
      >
        <.error :if={@check_errors}>
          糟糕，出了点问题！请查看下面的错误信息.
        </.error>

        <.input field={@form[:email]} type="email" label="邮箱" required />
        <.input field={@form[:password]} type="password" label="密码" required />

        <:actions>
          <.button phx-disable-with="Creating account..." class="w-1/2 m-auto mb-5">创建</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    changeset = Accounts.change_user_registration(%User{})

    socket =
      socket
      |> assign(trigger_submit: false, check_errors: false)
      |> assign_form(changeset)

    {:ok, socket, temporary_assigns: [form: nil]}
  end

  def handle_event("save", %{"user" => user_params}, socket) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Accounts.deliver_user_confirmation_instructions(
            user,
            &url(~p"/users/confirm/#{&1}")
          )

        changeset = Accounts.change_user_registration(user)
        {:noreply, socket |> assign(trigger_submit: true) |> assign_form(changeset)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, socket |> assign(check_errors: true) |> assign_form(changeset)}
    end
  end

  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset = Accounts.change_user_registration(%User{}, user_params)
    {:noreply, assign_form(socket, Map.put(changeset, :action, :validate))}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    form = to_form(changeset, as: "user")

    if changeset.valid? do
      assign(socket, form: form, check_errors: false)
    else
      assign(socket, form: form)
    end
  end
end
