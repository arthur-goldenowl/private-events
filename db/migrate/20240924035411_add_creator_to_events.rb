class AddCreatorToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :creator_id, :integer
  end
end
