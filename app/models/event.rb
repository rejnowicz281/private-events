class Event < ApplicationRecord
    belongs_to :host, class_name: "User", foreign_key: "host_id"

    has_many :attendances, foreign_key: "attended_event_id"
    has_many :attendees, through: :attendances

    validates :name, presence: true
    validates :description, presence: true
    validates :location, presence: true
end
