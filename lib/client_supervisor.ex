defmodule Dissonance.ClientSupervisor do
    use Supervisor

    def start_link(opts) do
        Supervisor.start_link(__MODULE__, :ok, opts)
    end

    def init(:ok) do
        Supervisor.init([Dissonance.Client], strategy: :simple_one_for_one)
    end
end
