class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
    has_many :attendances, foreign_key: 'attended_event_id', dependent: :destroy
    has_many :attendees, through: :attendances, source: :attendee, dependent: :destroy

    scope :past, -> { where('date < ?', Time.now) }
    scope :upcoming, -> { where('date > ?', Time.now) }

    validates :title, presence: true
    validates :date, presence: true
    validates :location, presence: true
    validates :creator_id, presence: true
    validates :date, uniqueness: { scope: :creator_id }
end
