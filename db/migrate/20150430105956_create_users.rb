class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :email
      t.string :password_digest
      t.string :avatar_url, default: "/public/images/gopher.jpg"

      t.timestamps
    end
  end
end
