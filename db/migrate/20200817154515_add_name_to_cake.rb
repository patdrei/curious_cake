class AddNameToCake < ActiveRecord::Migration[6.0]
  def change
    add_column :cakes, :name, :string
  end
end
