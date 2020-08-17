class CreateCakes < ActiveRecord::Migration[6.0]
  def change
    create_table :cakes do |t|
      t.text :description
      t.text :ingredients
      t.references :user, null: false, foreign_key: true
      t.text :requested_compensation
      t.integer :available_slices

      t.timestamps
    end
  end
end
