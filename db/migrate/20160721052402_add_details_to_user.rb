class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :mobile, :string
    add_column :users, :birthday, :date
  end

  def down
    def change
      remove_column :users, :firstname, :string
      remove_column :users, :lastname, :string
      remove_column :users, :mobile, :string
      remove_column :users, :birthday, :date
    end
  end
end
