class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_type, index: true, null: false
      t.string :name, index: true, null: false
      t.string :description
      t.json :metadata
      t.datetime :date, index: true

      t.timestamps
    end
  end
end
