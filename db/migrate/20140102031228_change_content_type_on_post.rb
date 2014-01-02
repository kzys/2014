class ChangeContentTypeOnPost < ActiveRecord::Migration
  def up
    change_column :posts, :content, :text, :limit => 1024
  end

  def down
    change_column :posts, :content, :string
  end
end
