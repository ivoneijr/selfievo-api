class CreateUsers < ActiveRecord::Migration
 def change
   create_table :users, id: :uuid  do |t|
     t.string :username, unique: true
     t.string :email, unique: true
     t.string :password
     t.string :token, unique: true
     t.string :activation_token
     t.boolean :active, default: false
    #  t.uuid :person_id
     t.datetime :current_sign_in_at
     t.datetime :last_sign_in_at
     t.datetime :last_password_retrieval_at
     t.inet     :current_sign_in_ip
     t.inet     :last_sign_in_ip

     t.timestamps null: false
   end
 end
end
