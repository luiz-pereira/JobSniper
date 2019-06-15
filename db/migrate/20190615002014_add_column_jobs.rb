class AddColumnJobs < ActiveRecord::Migration[5.2]
  def change
	add_column :jobs, :summary, :string
  end
end
