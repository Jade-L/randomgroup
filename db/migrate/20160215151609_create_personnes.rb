class CreatePersonnes < ActiveRecord::Migration
  def change
    create_table :personnes do |t|
      t.string :nom
      t.string :email
      t.integer :tel
      t.integer :group_id
      t.boolean :sensei

      t.timestamps null: false
    end
  end
end
