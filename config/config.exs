# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for third-
# party users, it should be done in your mix.exs file.

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
config :ecto_multi_slaves, EctoMultiSlaves.Repo.Master,
                         adapter: Ecto.Adapters.Postgres,
                         database: "ecto_simple",
                         username: "postgres",
                         password: "postgres",
                         hostname: "localhost",
                         port: 5432

config :ecto_multi_slaves, EctoMultiSlaves.Repo.SlaveOne,
                         adapter: Ecto.Adapters.Postgres,
                         database: "slaveone",
                         username: "postgres",
                         password: "postgres",
                         hostname: "localhost",
                         port: 5434

config :ecto_multi_slaves, EctoMultiSlaves.Repo.SlaveTwo,
                         adapter: Ecto.Adapters.Postgres,
                         database: "slavetwo",
                         username: "postgres",
                         password: "postgres",
                         hostname: "localhost",
                         port: 5436

config :ecto_multi_slaves, EctoMultiSlaves.Repo.SlaveThree,
                         adapter: Ecto.Adapters.Postgres,
                         database: "slavethree",
                         username: "postgres",
                         password: "postgres",
                         hostname: "localhost",
                         port: 5438

config :ecto_multi_slaves, EctoMultiSlaves.Repo.SlaveFour,
                         adapter: Ecto.Adapters.Postgres,
                         database: "slavefour",
                         username: "postgres",
                         password: "postgres",
                         hostname: "localhost",
                         port: 5440
