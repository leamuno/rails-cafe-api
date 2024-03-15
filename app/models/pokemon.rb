class Pokemon < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  # validates :address, presence: true
  # validates :pictures, presence: true
end
