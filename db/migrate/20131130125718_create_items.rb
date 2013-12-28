class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url
      t.string :category

      t.timestamps
    end
  end
end
