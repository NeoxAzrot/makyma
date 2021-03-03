class CreateSuggestedAlternatives < ActiveRecord::Migration[5.2]
  def change
    create_table :suggested_alternatives do |t|
      t.belongs_to :product, foreign_key: true
      t.string :title
      t.text :description
      t.text :source
      t.text :find
      t.string :imgUrl

      t.timestamps
    end
  end
end
