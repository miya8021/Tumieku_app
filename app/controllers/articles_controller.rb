class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update destroy]

  def index
    @articles = Article.includes(:user, :likes).order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to articles_path, notice: '投稿しました'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.includes(:user).order(created_at: :desc)
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: '更新しました'
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @article.destroy!
    redirect_to articles_path, alert: '削除しました'
  end

  private

  def article_params
    params.require(:article).permit(:day, :minutes, :body, :exercise_id)
  end

  def set_article
    # 「自分の投稿」の中から URL の :id に対応する投稿を探し、「他人の投稿」の場合はエラー
    @article = current_user.articles.find(params[:id])
  end
end