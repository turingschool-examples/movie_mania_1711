class CreateOscars < ActiveRecord::Migration[5.1]
  def change
    create_table :oscars do |t|
      t.references :movie, foreign_key: true
      t.references :award, foreign_key: true
      t.integer :year
    end
  end
end
