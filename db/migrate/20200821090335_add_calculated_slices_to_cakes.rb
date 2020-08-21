class AddCalculatedSlicesToCakes < ActiveRecord::Migration[6.0]
  def change
    add_column :cakes, :calculated_slices, :integer
  end
end
