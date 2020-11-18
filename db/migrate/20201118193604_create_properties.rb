class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.integer :size
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.string :type
      t.text :note
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
