class AddInitialTables < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :active, null: false

      t.timestamps null: false
    end

    create_table :assignments do |t|
      t.string :name
      t.datetime :date, null: false
      t.integer :course_id, null: false

      t.timestamps null: false
    end

    create_table :assignment_sections do |t|
      t.text :instructions, null: false
      t.string :location
      t.string :related_urls
      t.integer :assignment_id, null: false

      t.timestamps null: false
    end
  end
end
