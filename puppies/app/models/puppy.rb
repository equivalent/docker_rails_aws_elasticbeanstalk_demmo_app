class Puppy < ApplicationRecord
  validates_presence_of :name, :url
  scope :ordered, -> { order :id }
end
