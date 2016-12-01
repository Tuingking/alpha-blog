class AddDescriptionToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :description, :text
    # code below same like t.timestamps if we first created table
    # name of created_at and updated_at should be exact otherwise rails will not track
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
