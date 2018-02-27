class CreateUserAwards < ActiveRecord::Migration[5.1]
  def change
    create_table :user_awards do |t|
      t.references :user, foreign_key: true
      t.references :award, foreign_key: true
    end
  end
end
