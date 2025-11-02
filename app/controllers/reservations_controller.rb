class ReservationsController < ApplicationController
  def create
    reservation = Reservation.create_new_reservation(reservation_params)
    # 保存成功チェック
    if reservation.persisted?
      render json: { message: '予約をが成功しました。' }, status: :created
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    reservation = Reservation.delete_reservation(params)
    return render(json: { error: '指定された予約が見つかりません。' }, status: :not_found) if reservation.nil?

    render json: { message: '予約を削除しました。' }, status: :ok
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_name, :court_name, :start_time)
  end
end
