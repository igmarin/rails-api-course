class ArticleSerializer
  include JSONAPI::Serializer
  attributes :slug, :title, :content
end
