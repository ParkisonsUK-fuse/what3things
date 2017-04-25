defmodule What3things.Service do
  use What3things.Web, :model
  alias What3things.Service

  schema "services" do
    field :title, :string
    field :body, :string
    field :cta, :string
    field :url, :string
    field :early_onset, :boolean
    field :shortcode, :string
  end

  @valid_fields [:title, :body, :cta, :url, :early_onset, :shortcode]
  @required_fields [:title, :body, :cta, :url, :early_onset, :shortcode]

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @valid_fields)
    |> validate_required(@required_fields)
  end

  def services_by_id(ids) do
    from s in Service, where: s.id in ^ids
  end
end
