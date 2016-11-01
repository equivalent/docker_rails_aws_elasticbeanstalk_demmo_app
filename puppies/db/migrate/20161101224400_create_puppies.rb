class CreatePuppies < ActiveRecord::Migration[5.0]
  def change
    create_table :puppies do |t|
      t.string :url
      t.string :name
      t.integer :like_counter

      t.timestamps
    end
  end
end
