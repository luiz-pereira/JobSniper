class CreateTables < ActiveRecord::Migration[5.2]
  def change
	create_table :users do |t|
		t.string :username
		t.string :password_digest
	end
	create_table :requests do |t|
		t.integer :user_id
		t.datetime :date_updated
		t.string :name
	end
	create_table :parameters do |t|
		t.integer :request_id
		t.string :include
		t.string :exclude
		t.string :city
		t.string :province
		t.string :country
	end
	create_table :jobs do |t|
		t.integer :request_id
		t.datetime :date_posted
		t.string :source
		t.string :title
		t.string :company
		t.text :description
		t.string :type
		t.string :seniority
		t.string :city
		t.string :province
		t.string :country
		t.string :link
	end

  end
end
