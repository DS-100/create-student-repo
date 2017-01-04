# frozen_string_literal: true
class AddSlugToRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :slug, :string
    add_index :registrations, :slug, unique: true
  end
end
