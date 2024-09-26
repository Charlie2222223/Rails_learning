class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.references :department, foreign_key: true
      t.string :name
      t.string :ruby
      t.string :sex
      t.string :tel
      t.string :mobile
      t.string :mail
      t.string :zip
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :address4
      t.string :address5
      t.date :birthday

      t.timestamps
    end
  end
end
