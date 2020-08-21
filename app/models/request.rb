class Request < ApplicationRecord
  belongs_to :cake
  belongs_to :user
  has_many :messages, dependent: :destroy
end
