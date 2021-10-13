# frozen_string_literal: true

# ArticlesController
class ArticlesController < ApplicationController
  include Paginable

  def index
    paginated = paginate(Article.recent)
    render_collection(paginated)
  end

  def show
    @article = Article.find(params[:id])
    render json: ArticleSerializer.new(@article)
  end

  def serializer
    ArticleSerializer
  end
  
end
