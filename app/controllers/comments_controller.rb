class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    # buildメソッドを用いて、commentインスタンスにarticle_idをセットして作成
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'コメントできませんでした'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    current_user.comments.find(params[:id]).destroy!
    flash[:alert] = '削除しました'
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :article_id).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end