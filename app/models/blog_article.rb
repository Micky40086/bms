class BlogArticle < ApplicationRecord
  belongs_to :admin
  validates_presence_of :title
end
