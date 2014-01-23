class AddLanguageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :language, :string, :limit => 3
  end
end
