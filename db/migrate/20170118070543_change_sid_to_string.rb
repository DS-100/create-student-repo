class ChangeSidToString < ActiveRecord::Migration[5.0]
  def up
    change_column :registrations, :sid, :string
  end

  def down
    change_column :registrations, :sid, :integer
  end
end
