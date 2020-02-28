class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin_role, :boolean, default: false
  end
end
