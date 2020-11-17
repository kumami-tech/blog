class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string     :nickname, null: false, limit: 20
      t.text       :content,  null: false, limit: 1000
      t.references :post,     foreign_key: true
      t.timestamps
    end
  end
end


