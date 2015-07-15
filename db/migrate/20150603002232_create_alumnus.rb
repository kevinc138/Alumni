class CreateAlumnus < ActiveRecord::Migration
  def change
    create_table :alumnus do |t|
      t.string :firstname
      t.string :lastname
      t.integer :gradyear
      t.string :email
      t.string :address
      t.string :major

      t.timestamps null: false
    end
  end
end
