Sequel.migration do
  change do
    create_table(:bookings) do
      primary_key :id
      Date :date, null: false
      foreign_key :movie_id, :movies
    end
  end
end
