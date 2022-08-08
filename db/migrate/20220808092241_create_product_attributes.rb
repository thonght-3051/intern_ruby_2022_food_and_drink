class CreateProductAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :product_attributes do |t|
      t.float :price
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true

      t.timestamps
    end
  end
end
