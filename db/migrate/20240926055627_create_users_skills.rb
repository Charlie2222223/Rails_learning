class CreateUsersSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :users_skills do |t|
      t.references :users, foreign_key: true
      t.references :skills, foreign_key: true

      t.timestamps
    end
  end
end
