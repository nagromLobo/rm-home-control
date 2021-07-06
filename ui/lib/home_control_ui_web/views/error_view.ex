defmodule HomeControlUiWeb.ErrorView do
  use HomeControlUiWeb, :view

  def render("500.json", %{message: message}) do
    %{errors: [%{message: message}]}
  end

  # TODO support communicating multiple hue errors
  def render("hue_error.json", %{message: message}) do
    %{errors: [%{message: message}]}
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    %{errors: [%{message: Phoenix.Controller.status_message_from_template(template)}]}
  end
end
