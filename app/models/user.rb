class User < ApplicationRecord
    has_many :events, foreign_key: "host_id"
end
