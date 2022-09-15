class RoomsController < ApplicationController
  before_action :authenticate_user!,only: [:new,:create,:regist_room]
  
  def new
    @room = Room.new
    @user_id = current_user.id
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name,:introduction,:price,:address,:image,:user_id))
    if @room.save
      flash[:notice_success] = "登録しました"
      redirect_to :rooms_regist
    else
      flash.now[:notice_fail] = "登録できませんでした"
      render "new",status: :unprocessable_entity
    end
  end

  def show
    @room = Room.find(params[:id])
    session[:room_id] = params[:id]
    @mypage = Mypage.find_by(user_id: @room.user_id)
  end

  def regist_room
    id = current_user.id
    @rooms = Room.where(user_id: id)
  end

  def search
    if params[:area].present?
      @rooms = Room.where('address LIKE ?', "%#{params[:area]}%")
    elsif params[:word].present?
      @rooms = Room.where(['room_name LIKE (?) OR introduction LIKE (?) OR address LIKE (?)', "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%"])
    else
      @rooms = Room.all
    end
  end
end
