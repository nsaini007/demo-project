class AddVacanciesToJob < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :vacancies, :integer
  end
end
