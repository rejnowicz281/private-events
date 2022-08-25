class Event < ApplicationRecord
    belongs_to :host, class_name: "User", foreign_key: "host_id"

    has_many :attendances, foreign_key: "attended_event_id", dependent: :destroy
    has_many :attendees, through: :attendances

    has_many :invites, inverse_of: :event

    validates :name, presence: true
    validates :description, presence: true
    validates :location, presence: true

    scope :past, -> { where('date < ?', DateTime.now) }
    scope :upcoming, -> { where(date: DateTime.now..) }
end
