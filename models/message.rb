class Message < ActiveRecord::Base
  validates :body, presence: true
  validates :scheduled_at, presence: true
  validates :completed, :inclusion => [true, false]
end