class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    # Table, name of attribute, type
    add_column :articles, :description, :text
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
