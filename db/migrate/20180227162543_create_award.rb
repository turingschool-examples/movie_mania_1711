class CreateAward < ActiveRecord::Migration[5.1]
  def change
    create_table :awards do |t|
      t.references :movie, foreign_key: true
      t.string :title
    end
  end
end
