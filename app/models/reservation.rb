class Reservation < ApplicationRecord
  belongs_to :court
  belongs_to :user

  validate :double_booking

  def self.create_new_reservation(params)
    user = User.find_by!(name: params[:user_name])
    court = Court.find_by!(name: params[:court_name])
    start_time = Time.zone.parse(params[:start_time])
    end_time = start_time + 1.hour

    self.create(
      user: user,
      court: court,
      start_time: start_time,
      end_time: end_time
    )
  end

  private

  def double_booking
    if Reservation.where(court_id: court_id, start_time: start_time)
                  # 自分自身との重複を除外
                  .where.not(id: id)
                  .exists?
      errors.add(:base, 'この時間帯は既に予約されています。')
    end
  end
end
