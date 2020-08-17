class AddContentToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :content, :text
  end
end
