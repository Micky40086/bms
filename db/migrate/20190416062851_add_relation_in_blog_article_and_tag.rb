class AddRelationInBlogArticleAndTag < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_article_tag_relations, id: false do |t|
      t.belongs_to :blog_article, index: true
      t.belongs_to :blog_tag, index: true
    end
  end
end
