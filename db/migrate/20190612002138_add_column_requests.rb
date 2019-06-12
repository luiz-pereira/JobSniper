class AddColumnRequests < ActiveRecord::Migration[5.2]
  def change
	create_table :job_titles_request do |t|
		t.string :job_title
		t.integer :request_id
	end
	change_column :parameters, :exclude, :boolean
	rename_column :parameters, :include, :criteria
	remove_column :parameters,:city
	remove_column :parameters,:province
	remove_column :parameters,:country
	create_table :location_request do |t|
		t.string :city
		t.string :province
		t.string :country
		t.integer :request_id
	end
  end
end
