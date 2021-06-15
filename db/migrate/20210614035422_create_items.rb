class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :used_id
      t.integer :price
      t.integer :area_id
      t.integer :shopping_cost_id
      t.integer :takes_day_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
