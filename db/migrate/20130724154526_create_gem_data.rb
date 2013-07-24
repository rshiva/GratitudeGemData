class CreateGemData < ActiveRecord::Migration
  def change
    create_table :gem_data do |t|
      t.string :author_email
      t.string :user_email
      t.string :message
      t.string :gem_name

      t.timestamps
    end
  end
end
