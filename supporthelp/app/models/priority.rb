class Priority < ActiveRecord::Base
  has_many :tickets

  validates :description, presence: true, length: { minimum: 1, maximum: 15 }
end
