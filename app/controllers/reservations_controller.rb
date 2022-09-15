class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    id = current_user.id
    @reservations = Room.joins(:reservations).select("rooms.*,reservations.*,reservations.created_at AS reserved_date ,reservations.room_id AS id").where(reservations: { user_id: id })
  end

  def new
    session[:reservation] = params
    redirect_to :reservations_confirm
  end

  def confirm
    @room = Room.find(session[:room_id])
    @start_date = session[:reservation]["start_date"]
    @end_date = session[:reservation]["end_date"]
    @people = session[:reservation]["people"]
    today = Date.current
    id = session[:room_id]
    if @start_date.present? && @end_date.present? && @people.present?
      if @start_date.to_date < today
        flash[:notice_fail] = "今日以降の日にちを選択してください"
        redirect_to "/rooms/#{id}"
      elsif @start_date > @end_date
        flash[:notice_fail] = "開始日以降の日にちを選択してください"
        redirect_to "/rooms/#{id}"
      else
        @current_user = current_user.id
        @date = (-(@start_date.to_date - @end_date.to_date)).to_i
        @total_price = @room.price * @people.to_i * @date
        @reservation = Reservation.new
      end
    else
      flash[:notice_fail] = "予約できませんでした"
      redirect_to "/rooms/#{id}"
    end
  end
  
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:user_id,:start_date,:end_date,:people,:room_id,:total_price))
    if @reservation.save
      flash[:notice_success] = "予約しました"
      redirect_to :reservations_rooms
    else
      flash.now[:notice_fail] = "予約できませんでした"
      render "confirm",status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
  end

end
