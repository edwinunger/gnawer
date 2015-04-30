class CreateGnaws < ActiveRecord::Migration
  def change
    create_table :gnaws do |t|
      t.string :content
      t.belongs_to :user

      t.timestamps
    end
  end
end
