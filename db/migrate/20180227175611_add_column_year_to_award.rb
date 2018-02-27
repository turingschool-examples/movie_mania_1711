class AddColumnYearsToAwards < ActiveRecord::Migration[5.1]
  def change
    add_reference :awards, :year, foreign_key: true
  end
end
