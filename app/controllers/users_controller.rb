class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes  ##@userに関するprototypesテーブルの情報を取得
  end

end
