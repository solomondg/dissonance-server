defmodule Dissonance.Repo do
  use Ecto.Repo, otp_app: :dissonance
end

defmodule Dissonance.User do
    use Ecto.Schema

    @primary_key {:user_id, :id, autogenerate: true}

    schema "user" do
        field :username
        field :passwd
        field :salt
    end

end

defmodule Dissonance.Session do
    use Ecto.Schema

    @primary_key {:session_id, :id, autogenerate: true}

    schema "session" do
        field :session_key
        field :user_id, :integer
        field :start_timestamp, :utc_datetime
        field :end_time, :utc_datetime
    end
end

defmodule Dissonance.ChatRoom do
    use Ecto.Schema

    @primary_key {:room_id, :id, autogenerate: true}

    schema "room" do
        field :room_name
    end
end

defmodule Dissonance.UserRoom do
    use Ecto.Schema

    @primary_key {:user_room_id, :id, autogenerate: true}

    schema "user_room" do
        field :user_id, :integer
        field :room_id, :integer
        field :role, :integer
    end
end

defmodule Dissonance.Message do
    use Ecto.Schema

    @primary_key {:message_id, :id, autogenerate: true}

    schema "message" do
        field :user_id, :integer
        field :room_id, :integer
        field :message
    end
end
