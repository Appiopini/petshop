class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :owner
      t.string :name
      t.string :type
      t.string :care

      t.timestamps
    end
  end
end
