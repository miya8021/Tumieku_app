class LikesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    current_user.likes.create!(article_id: @article.id)
  end

  def destroy
    @article = Article.find(params[:article_id])
    current_user.likes.find_by(article_id: @article.id).destroy!
  end
end