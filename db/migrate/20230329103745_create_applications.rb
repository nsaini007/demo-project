class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.references :job, null: false, foreign_key: true
      t.references :applicant, null: false

      t.timestamps
    end
    add_foreign_key :applications, :users, column: :applicant_id
  end
end
