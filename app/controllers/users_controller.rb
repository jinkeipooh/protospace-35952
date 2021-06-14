class UsersController < ApplicationController

  def show
    prototype = Prototype.find(params[:id])
    @user = prototype.user
    @prototypes = @user.prototypes  ##@userに関するprototypesテーブルの情報を取得
  end

end
