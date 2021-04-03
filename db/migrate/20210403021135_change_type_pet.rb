class ChangeTypePet < ActiveRecord::Migration[6.0]
  def change
    rename_column :pets, :type, :race
  end
end
