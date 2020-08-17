class Cake < ApplicationRecord
  belongs_to :user
  has_many :requests
end
