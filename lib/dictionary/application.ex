defmodule Dictionary.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      %{id: Dictionary.WordList, start: {Dictionary.WordList, :start_link, []}}
    ]

    options = [
      name: Dictionary.Superviser,
      strategy: :one_for_one
    ]

    Supervisor.start_link(children, options)
  end
end
