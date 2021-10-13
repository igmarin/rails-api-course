# frozen_string_literal: true

# ArticlesController
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: ArticleSerializer.new(@articles).serializable_hash
  end

  def show
    @article = Article.find(params[:id])
    render json: ArticleSerializer.new(@article)
  end
end
