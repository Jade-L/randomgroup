class CreateGroupes < ActiveRecord::Migration
  def change
    create_table :groupes do |t|
      t.string :nom
      t.string :salle
      t.string :tache

      t.timestamps null: false
    end
  end
end
