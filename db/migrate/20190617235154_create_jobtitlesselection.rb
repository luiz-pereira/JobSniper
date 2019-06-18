class CreateJobtitlesselection < ActiveRecord::Migration[5.2]
  def change
	create_table :job_title_selections do |t|
		t.integer :user_id
		t.string :title_select
	end
  end
end
