class AddProjectNameToGemData < ActiveRecord::Migration
  def change
    add_column :gem_data, :project_name, :string
  end

  add_index :gem_data, :author_email
  add_index :gem_data, :user_email
  add_index :gem_data, :message
end
