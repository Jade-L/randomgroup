class ChangeTelToPersonnes < ActiveRecord::Migration
  def change
     change_column :personnes, :tel, :string
  end
end
