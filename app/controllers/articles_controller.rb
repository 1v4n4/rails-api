class ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: serializer.new(articles), status: :ok #will be ok without status set
  end

  def show
  end

  def serializer
    ArticleSerializer
  end
end