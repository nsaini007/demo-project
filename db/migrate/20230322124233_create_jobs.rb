class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.references :recruiter, null: false
      

      t.timestamps
    end
    add_foreign_key :jobs, :users, column: :recruiter_id
  end
end
