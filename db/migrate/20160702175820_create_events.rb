class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, index: true, null: false
      t.integer :value, null: false
      t.datetime :date, index: true, null: false

      t.timestamps
    end
  end
end
