class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :cake, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :requested_slices
      t.string :status
      t.text :compensation_offered

      t.timestamps
    end
  end
end
