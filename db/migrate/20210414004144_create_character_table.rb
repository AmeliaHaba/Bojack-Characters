class CreateCharacterTable < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :name
      t.string :gender 
      t.boolean :animal?, default: false
      t.boolean :depressed?, default: false
    end
  end

end
