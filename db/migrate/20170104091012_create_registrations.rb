# frozen_string_literal: true
class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.timestamps

      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :sid, null: false
      t.string :email, null: false
      t.string :github_username, null: false
    end

    add_index :registrations, :email, unique: true
    add_index :registrations, :sid, unique: true
    add_index :registrations, :github_username, unique: true
  end
end
