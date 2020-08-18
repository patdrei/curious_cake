class AddEatNowToCake < ActiveRecord::Migration[6.0]
  def change
    add_column :cakes, :eat_by, :datetime
  end
end
