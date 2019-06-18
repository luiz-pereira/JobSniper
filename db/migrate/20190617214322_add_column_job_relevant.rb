class AddColumnJobRelevant < ActiveRecord::Migration[5.2]
  def change
	add_column :jobs, :relevant, :boolean
  end
end
