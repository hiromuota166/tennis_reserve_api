class ReservationsController < ApplicationController
  def create
    reservation = Reservation.create_new_reservation(reservation_params)
    # 保存成功チェック
    if reservation.persisted?
      render json: reservation, status: :created
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_name, :court_name, :start_time)
  end
end
