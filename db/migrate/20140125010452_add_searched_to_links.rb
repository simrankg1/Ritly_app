class AddSearchedToLinks < ActiveRecord::Migration
  def change
    add_column :links, :searched, :string
  end
end
