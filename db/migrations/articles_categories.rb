require_relative "../db_config"

class ArticlesCategories < ActiveRecord::Migration
  def up
    create_table :articles_categories do |t|
      t.integer :category_id
      t.integer :article_id
    end
  end

  def down
    drop_table :articles_categories
  end
end

ArticlesCategories.migrate(ARGV[0])