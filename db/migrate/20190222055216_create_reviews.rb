class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :content
      t.integer :stars

      t.timestamps
    end
  end
end
