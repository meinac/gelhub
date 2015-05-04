class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.references :user
      t.references :repository
      t.string :labels, array: true, default: []
      t.string :keywords, array: true, default: []
      t.integer :for, default: 0
      t.timestamps null: false
    end
  end
end
