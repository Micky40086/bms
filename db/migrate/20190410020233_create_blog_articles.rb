class CreateBlogArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_articles do |t|
      t.references :admin, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
