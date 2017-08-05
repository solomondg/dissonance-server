require Ecto.Query

defmodule Dissonance.ChatRoom do
    use GenServer

    #############
    ## Client API
    #############

    def start_link(serv_info) do
        GenServer.start_link(__MODULE__, :ok, serv_info)
    end

    def broadcast(serv_info, message) do
        Enum.each :pg2.get_members(Map.get(serv_info, room_id)), fn -> pid
        send pid, {:message, message}
    end

    ###################
    ## Server Callbacks
    ###################

    def init(serv_info) do

        room_name = Map.get(serv_info, "room_name")

        new_room = %Dissonance.ChatRoom{room_name: room_name}
        Dissonance.Repo.insert(new_room)

        Dissonance.ChatRoom |> Dissonance.Repo.where(room_name: room_name)

        {:ok, serv_info}
    end

    def handle_info({:message, message}, serv_info) do
        Local.broadcast(message)
        {:noreply, serv_info}
    end
end
