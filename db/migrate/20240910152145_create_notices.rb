class CreateNotices < ActiveRecord::Migration[7.1]
  def change
    create_table :notices do |t|
      t.text :title
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
