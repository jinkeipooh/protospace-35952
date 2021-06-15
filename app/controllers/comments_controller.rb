class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype_id)  #:prototype_idは /prototypes/:prototype_id/comments(.:format)   comments#create(URIパターン)からきている。→というか、commentテーブルのprototype_id
    else
      @prototype = Prototype.find(@comment.prototype_id)   #protypesコントローラーとクラスが違うので、改めて定義しなければならない
      @comments = @prototype.comments.includes(:user)   #protypesコントローラーとクラスが違うので、改めて定義しなければならない
      render "prototypes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])  #:prototype_idは /prototypes/:prototype_id/comments(.:format)   comments#create(URIパターン)からきている。
  end
end
