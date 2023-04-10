class CreateRecruiterProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :recruiter_profiles do |t|
      t.references :company, null: false, foreign_key: true
      t.references :recruiter, null: false

      t.timestamps
    end
    add_foreign_key :recruiter_profiles, :users, column: :recruiter_id
  end
end
