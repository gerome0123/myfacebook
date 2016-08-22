class AddMobileToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :mobile, :text

  end
end
