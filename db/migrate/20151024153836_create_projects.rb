class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :uri, null: false, index: true
      t.timestamps null: false
    end
  end
end
