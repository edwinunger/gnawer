class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :email
      t.string :password_digest
      t.string :avatar_url, default: "http://i.imgur.com/VQ3Lu9l.jpg"

      t.timestamps
    end
  end
end
