defmodule Fundamentals.Entities.User do
  # id can be null
  @enforce_keys [:name, :email, :password]
  defstruct [:id, :name, :email, :password]
end

# user = %User{name: "john", email: "john@gmail.com", password: "123"}
