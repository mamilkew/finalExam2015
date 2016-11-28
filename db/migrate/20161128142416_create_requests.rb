class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :topic
      t.text :description
      t.text :location
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
