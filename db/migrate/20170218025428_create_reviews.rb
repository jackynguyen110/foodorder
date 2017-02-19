class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.references :food_item, foreign_key: true
      t.datetime :created_at

      t.timestamps
    end
  end
end
