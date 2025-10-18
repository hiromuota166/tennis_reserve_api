class Reservation < ApplicationRecord
  belongs_to :court_id
  belongs_to :user_id
end
