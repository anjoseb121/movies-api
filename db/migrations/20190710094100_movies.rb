Sequel.migration do
  change do
    create_table(:movies) do
      primary_key :id
      String :name, null: false
      String :description, null: false
      String :cover_url, null: false
      String :days, null: false
    end
  end
end
