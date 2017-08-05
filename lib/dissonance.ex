defmodule Dissonance do
    use Application

    def start(_type, _args) do
        Dissonance.RoomSupervisor.start_link(name: Dissonance.RoomSupervisor)
    end

end
