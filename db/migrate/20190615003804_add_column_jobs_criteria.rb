class AddColumnJobsCriteria < ActiveRecord::Migration[5.2]
  def change
	add_column :jobs, :criteria, :string
	rename_column :jobs, :type, :tipe
  end
end
