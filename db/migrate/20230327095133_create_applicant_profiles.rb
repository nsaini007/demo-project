class CreateApplicantProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :applicant_profiles do |t|
      t.references :applicant, null: false
      t.timestamps
    end
    add_foreign_key :applicant_profiles, :users, column: :applicant_id
  end
end
