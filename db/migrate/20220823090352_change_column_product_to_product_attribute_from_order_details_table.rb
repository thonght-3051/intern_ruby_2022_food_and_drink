class ChangeColumnProductToProductAttributeFromOrderDetailsTable < ActiveRecord::Migration[6.1]
  def change
    remove_reference :order_details, :product, index: false, foreign_key: true
    remove_column :order_details, :product, if_exists: true
    add_reference :order_details, :product_attributes, index: true, foreign_key: true, after: :quantity
  end
end
