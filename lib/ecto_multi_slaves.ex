defmodule Master do
  use Ecto.Repo, otp_app: :master
end

defmodule SlaveOne do
  use Ecto.Repo, otp_app: :slave_two
end

defmodule SlaveTwo do
  use Ecto.Repo, otp_app: :slave_two
end

defmodule SlaveThree do
  use Ecto.Repo, otp_app: :slave_three
end

defmodule Post do
  use Ecto.Model

  schema "posts" do
    field :title, :string
  end
end

defmodule EctoMultiSlaves.App do
  use Application
end


defmodule EctoMultiSlaves do


end
