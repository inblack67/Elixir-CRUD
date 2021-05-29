defmodule Fundamentals do
  @db_path "users.bin"

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
    new_Data = [user | get_users()]
    File.write!(@db_path, :erlang.term_to_binary(new_Data))
    new_Data
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

  def get_users, do: load()
end
