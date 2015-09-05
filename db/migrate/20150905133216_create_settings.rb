class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :key, index: true, null: false
      t.string :value, null: false
      t.boolean :can_removed, null: false, default: true
    end

    add_index :settings, [:key], unique: true, name: 'dimensions'
  end
end
