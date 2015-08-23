class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name, null: false, limit: 255, unique: true
      t.boolean :can_eat

      t.timestamps null: false
    end
  end
end
