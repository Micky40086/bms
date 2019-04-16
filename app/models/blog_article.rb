class BlogArticle < ApplicationRecord
  belongs_to :admin
  validates_presence_of :title
  has_and_belongs_to_many :blog_tags, join_table: "blog_article_tag_relations"


  def set_tags(admin, tag_ids = [])
    blog_tags = admin.blog_tags.where(:id => tag_ids)
    self.blog_tags.replace(blog_tags)
  end
end
