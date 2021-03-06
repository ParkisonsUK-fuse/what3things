defmodule ParkinsonsAndMe.Service do
  use ParkinsonsAndMe.Web, :model
  alias ParkinsonsAndMe.Service

  schema "services" do
    field :title, :string
    field :body, :string
    field :cta, :string
    field :url, :string
    field :early_onset, :boolean
    field :location_based_url, :boolean
  end

  @valid_fields [:title, :body, :cta, :url, :early_onset, :location_based_url]
  @required_fields [:title, :body, :cta, :url, :early_onset, :location_based_url]

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @valid_fields)
    |> validate_required(@required_fields)
  end

  def services_by_id(ids) do
    from s in Service,
      where: s.id in ^ids,
      select: {s.id, s}
  end
end
