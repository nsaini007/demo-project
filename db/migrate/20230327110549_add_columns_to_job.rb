class AddColumnsToJob < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :salary, :integer
    add_column :jobs, :job_type, :string
  end
end
