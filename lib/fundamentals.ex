defmodule Fundamentals do
  # list
  @users [
    # map
    %{
      name: "name1",
      email: "email1",
      password: "password1"
    }
  ]

  # Fundamentals.add_user(%{name: "name2", email: "email2", password: "password2"})
  def add_user(user) do
    [user | @users]

    # or
    # @users ++ user
  end

  # iex => Fundamentals.log
  def log, do: @users
end
