class Users < ActiveRecord::Migration[5.0]
  def change
		create_table :users do |t|
		  t.string :email
		  t.string :username
		  t.string :last_name 
		  t.string :first_name
		  t.string :password_digest
		end
  end
end
