class ChangeTelToPersonnes < ActiveRecord::Migration
  def change
     change_column :people, :tel, :string
  end
end
