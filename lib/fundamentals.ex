defmodule Fundamentals do
  @db_path "users.bin"

  alias Fundamentals.Entities.User

  def get_users, do: load()

  # Fundamentals.add_user(%{name: "name2", email: "email2", password: "password2"})
  # pattern matching the argument
  # user = %User{name: "name1", email: "email1", password: "password1"}
  # Fundamentals.add_user(user)

  # id should be nil in user's input
  def add_user(%User{id: nil} = user) do
    last_id = get_last_id()

    # struct creates or updates a struct
    user_with_id = struct(user, %{id: last_id + 1})

    updated_users = [user_with_id | get_users()]
    File.write!(@db_path, :erlang.term_to_binary(updated_users))
    updated_users
  end

  defp load do
    if File.exists?(@db_path) do
      :erlang.binary_to_term(File.read!(@db_path))
    else
      starting_value = []
      File.write!(@db_path, :erlang.term_to_binary(starting_value))
      starting_value
    end
  end

  defp get_last_id do
    if get_users() === [] do
      0
    else
      get_users()
      # get user with latest id (max)
      |> Enum.max_by(fn user -> user.id end)
      # we want just the id
      |> Map.get(:id)
    end
  end
end
