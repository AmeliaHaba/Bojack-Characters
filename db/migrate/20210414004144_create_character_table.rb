class CreateCharacterTable < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :name
      t.boolean :animal?, default: false
    end
  end

end
