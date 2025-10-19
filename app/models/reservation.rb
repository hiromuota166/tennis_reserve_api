class Reservation < ApplicationRecord
  belongs_to :court
  belongs_to :user

  validate :double_booking

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
