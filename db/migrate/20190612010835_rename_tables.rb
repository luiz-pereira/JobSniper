class RenameTables < ActiveRecord::Migration[5.2]
  def change
	rename_table :job_titles_request, :job_titles
	rename_table :location_request, :locations
  end
end
