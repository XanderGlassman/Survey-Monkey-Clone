class CreateUsers < ActiveRecord::Migration
  def change
<<<<<<< HEAD
=======
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :email
      t.timestamps
    end
>>>>>>> master
  end
end
