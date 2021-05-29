defmodule Fundamentals.Entities.User do
  @enforce_keys [:name, :email, :password]
  defstruct [:name, :email, :password]
end

# user = %User{name: "john", email: "john@gmail.com", password: "123"}
