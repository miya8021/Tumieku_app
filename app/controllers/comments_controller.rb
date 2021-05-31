class CommentsController < ApplicationController

  def create
    article = Article.find(params[:article_id])
    @comment = current_user.comments.build(comment_params)
    @comment.article_id = article.id
    if @comment.save
      flash[:notice] = 'コメントしました'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'コメントできませんでした'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    current_user.comments.find_by(article_id: params[:article_id]).destroy!
    flash[:alert] = '削除しました'
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end