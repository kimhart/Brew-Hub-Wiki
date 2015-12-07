require_relative "../db_config"

class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.string(:title)
      t.integer(:date_created)
      t.string(:content)
      t.string(:last_edited)
      t.string(:img_url)
    end
  end

  def down
    drop_table :articles
  end
end

CreateArticles.migrate(ARGV[0])