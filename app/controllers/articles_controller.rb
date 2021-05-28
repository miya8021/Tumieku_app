class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.order(:created_at)
  end

  def new
    @article = Article.new
  end

  def create
    article = current_user.articles.create!(article_params)
    redirect_to articles_path, notice: '投稿しました'
  end

  def show
  end

  def edit
  end

  def update
    @article.update!(article_params)
    redirect_to articles_path, notice: '更新しました'
  end

  def destroy
    @article.destroy!
    redirect_to articles_path, alert: '削除しました'
  end

  private

  def set_article
    @article = current_user.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:day, :minutes, :body, :exercise_id)
  end
end