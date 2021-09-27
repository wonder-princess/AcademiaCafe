class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :url
      t.text :introduction
      t.string :kind
      t.string :tag_1
      t.string :tag_2
      t.string :tag_3
      t.string :tag_4
      t.string :tag_5

      t.timestamps
    end
  end
end
