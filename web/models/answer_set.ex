defmodule ParkinsonsAndMe.AnswerSet do
  use ParkinsonsAndMe.Web, :model
  alias ParkinsonsAndMe.{Answer, AnswerSet, Weight, Service}

  schema "answer_sets" do
    field :uuid, :string
    belongs_to :user, ParkinsonsAndMe.User

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :uuid])
    |> validate_required([:user_id, :uuid])
  end
end
