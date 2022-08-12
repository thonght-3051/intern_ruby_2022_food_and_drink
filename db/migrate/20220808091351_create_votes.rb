class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer :star
      t.string :comment
      t.integer :status
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
