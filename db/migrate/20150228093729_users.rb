class Users < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.string :username
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :company
      t.timestamps
    end
    create_table :group_user, id: false do |t|
      t.belongs_to :group, index: true
      t.belongs_to :user, index: true
    end
  end
  
end
