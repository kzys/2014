class AddAdminToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :admin, :boolean
  end
end
