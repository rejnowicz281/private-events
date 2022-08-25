class Invite < ApplicationRecord
    belongs_to :invited, class_name: "User", inverse_of: :invites_received
    belongs_to :inviting, class_name: "User", inverse_of: :invites
    belongs_to :event, inverse_of: :invites
end
