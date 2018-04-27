class ArticlesController < ApplicationController
 

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    @q = Article.ransack(params[:q])
  @articles = @q.result(distinct: true)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  
end
