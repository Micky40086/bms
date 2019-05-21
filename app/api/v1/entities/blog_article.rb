module V1::Entities
  class BlogArticle < Grape::Entity
    expose :id
    expose :title
    expose :content
    expose :created_at
    expose :updated_at
    expose :blog_tags, as: :tags, using: V1::Entities::Tag
  end
end