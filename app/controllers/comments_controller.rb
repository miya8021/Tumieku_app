class CommentsController < ApplicationController

  def create
    article = Article.find(params[:article_id])
    comment = current_user.comments.build(comment_params)
    comment.article_id = article.id
    comment.save
    redirect_to article_path(article.id)
  end

  def destroy
    comment = Comment.find_by(article_id: params[:article_id])
    comment.destroy!
    redirect_to articles_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end