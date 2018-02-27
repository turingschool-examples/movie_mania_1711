class AddUserToAward < ActiveRecord::Migration[5.1]
  def change
    add_reference :awards, :user, foreign_key: true
  end
end
