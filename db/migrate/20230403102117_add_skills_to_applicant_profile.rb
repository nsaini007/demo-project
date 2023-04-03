class AddSkillsToApplicantProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :applicant_profiles, :skills, :string , array: true, default: [].to_yaml
  end
end
