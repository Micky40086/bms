class BlogTag < ApplicationRecord
  belongs_to :admin
  has_and_belongs_to_many :blog_articles, join_table: "blog_article_tag_relations"
end
