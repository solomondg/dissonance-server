defmodule Dissonance.Client do
    use GenServer

    #########
    ## Client
    #########

    def start_link(opts) do
        GenServer.start_link(__MODULE__, :ok, opts)
    end

    ###################
    ## Server Callbacks
    ###################

    def init(room_id) do
         :ok = :pg2.join(room_id, self())
         {:ok, room_id}
    end

end
