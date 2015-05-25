defmodule EctoMultiSlaves.Repo do
  defmodule Master do
    use Ecto.Repo, otp_app: :ecto_multi_slaves
  end

  defmodule SlaveOne do
    use Ecto.Repo, otp_app: :ecto_multi_slaves
  end

  defmodule SlaveTwo do
    use Ecto.Repo, otp_app: :ecto_multi_slaves
  end

  defmodule SlaveThree do
    use Ecto.Repo, otp_app: :ecto_multi_slaves
  end

  defmodule SlaveFour do
    use Ecto.Repo, otp_app: :ecto_multi_slaves
  end

  def pick_repo do
    <<at::integer-size(2), _::bits>> = :crypto.rand_bytes(1)
    Enum.fetch! [
      EctoMultiSlaves.Repo.SlaveOne,
      EctoMultiSlaves.Repo.SlaveTwo,
      EctoMultiSlaves.Repo.SlaveThree,
      EctoMultiSlaves.Repo.SlaveFour
    ], at
  end

  def all(query, options \\ []) do
    repo = pick_repo
    IO.inspect repo
    repo.all(query, options) # Read goes through the random above
  end

  def update(changes, options \\ []) do
    EctoMultiSlaves.Repo.Master.update(changes, options) # Those go to master
  end

  def insert(changes, options \\[]) do
    EctoMultiSlaves.Repo.Master.insert(changes, options)
  end

end

defmodule Post do
  use Ecto.Model

  schema "posts" do
    field :title, :string
  end
end

defmodule EctoMultiSlaves do
  use Application
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    children = [
      worker(EctoMultiSlaves.Repo.Master, []),
      worker(EctoMultiSlaves.Repo.SlaveOne, []),
      worker(EctoMultiSlaves.Repo.SlaveTwo, []),
      worker(EctoMultiSlaves.Repo.SlaveThree, []),
      worker(EctoMultiSlaves.Repo.SlaveFour, []),
    ]
    opts = [strategy: :one_for_one, name: EctoMultiSlaves.Supervisor]
    Supervisor.start_link(children, opts)
  end
  import Ecto.Query

  def show_it do
    EctoMultiSlaves.Repo.insert(%Post{title: "Testing this out"})

    read_query = from p in Post, select: p

    IO.inspect EctoMultiSlave.Repo.all(read_query)
    IO.inspect EctoMultiSlave.Repo.all(read_query)
  end
end
