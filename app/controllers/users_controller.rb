class UsersController < ApplicationController

  def show
    @user = User.find(params[:id]) ##prototype_controllerのindex, _prototype, showから各々userを指定するidを受け取っている。
    @prototypes = @user.prototypes  ##@userに関するprototypesテーブルの情報を取得
  end

end
