defmodule Discuss.Repo.Migrations.AddTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add(:title, :string)
      timestamps(default: DateTime.utc_now() |> to_string)
    end
  end
end
