class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.integer :owner_id
      t.string :name
      t.string :full_name
      t.json :labels
      t.timestamps null: false
    end

    add_index :repositories, :full_name, unique: true
  end
end
