# frozen_string_literal: true
class AddRepoNameToRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :repo_name, :string
  end
end
