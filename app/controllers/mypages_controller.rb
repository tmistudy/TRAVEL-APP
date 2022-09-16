class MypagesController < ApplicationController
  before_action :authenticate_user!
  def account
  end

  def profile
    @mypage = Mypage.find_by(user_id: current_user.id)
  end

  def update
    @mypage = Mypage.find_by(user_id: current_user.id)
    if @mypage.update(params.require(:mypage).permit(:name, :my_img,:self_introduction))
      flash[:notice_success] = "更新しました"
      redirect_to :mypages_profile
    else
      flash.now[:notice_fail] = "更新に失敗しました"
      render "profile",status: :unprocessable_entity
    end
  end
end
