class CreateOrderitems < ActiveRecord::Migration
  def change
    create_table :orderitems do |t|
      t.integer :item_id
      t.string :title
      t.integer :quantity
      t.decimal :price
      t.references :order, index: true
      t.references :item, index: true

      t.timestamps
    end
  end
end
