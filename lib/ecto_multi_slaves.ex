defmodule EctoMultiSlaves.Repo.Master do
  use Ecto.Repo, otp_app: :master
end

defmodule EctoMultiSlaves.Repo.SlaveOne do
  use Ecto.Repo, otp_app: :slave_one
end

defmodule EctoMultiSlaves.Repo.SlaveTwo do
  use Ecto.Repo, otp_app: :slave_two
end

defmodule EctoMultiSlaves.Repo.SlaveThree do
  use Ecto.Repo, otp_app: :slave_three
end


defmodule Post do
  use Ecto.Model

  schema "posts" do
    field :title, :string
  end
end

defmodule EctoMultiSlaves do


end
