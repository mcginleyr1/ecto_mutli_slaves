defmodule EctoMultiSlaves.Repo.Master do
  use Ecto.Repo, otp_app: :ecto_multi_slaves
end

defmodule EctoMultiSlaves.Repo.SlaveOne do
  use Ecto.Repo, otp_app: :ecto_multi_slaves
end

defmodule EctoMultiSlaves.Repo.SlaveTwo do
  use Ecto.Repo, otp_app: :ecto_multi_slaves
end

defmodule EctoMultiSlaves.Repo.SlaveThree do
  use Ecto.Repo, otp_app: :ecto_multi_slaves
end

defmodule EctoMultiSlaves.Repo.SlaveFour do
  use Ecto.Repo, otp_app: :ecto_multi_slaves
end


defmodule EctoMultiSlaves.Repo do
  def pick_repo do
    <<at::integer-size(2), _::bits>> = :crypto.rand_bytes(1)
    Enum.fetch! [
      EctoMultiSlaves.Repo.SlaveOne,
      EctoMultiSlaves.Repo.SlaveTwo,
      EctoMultiSlaves.Repo.SlaveThree,
      EctoMultiSlaves.Repo.SlaveFour
      ], at
  end
end



defmodule Post do
  use Ecto.Model

  schema "posts" do
    field :title, :string
  end
end

defmodule EctoMultiSlaves do


end
