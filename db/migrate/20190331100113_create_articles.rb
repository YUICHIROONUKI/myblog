class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.text :body, null: false
      t.string :topic, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
