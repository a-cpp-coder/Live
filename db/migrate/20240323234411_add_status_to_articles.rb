class AddStatusToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :status, :string, :default => "public"  # adding default after migrating does not work, need a new migration method
  end
end
