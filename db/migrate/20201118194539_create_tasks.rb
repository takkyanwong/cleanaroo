class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.float :price
      t.string :title

      t.timestamps
    end
  end
end
