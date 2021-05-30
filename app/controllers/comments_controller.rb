class CommentsController < ApplicationController

  def create
    current_user.comments.create!(article_id: params[:article_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.comments.find_by(article_id: params[:article_id]).destroy!
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
