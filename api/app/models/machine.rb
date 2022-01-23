class Machine < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :muscle_machines
  has_many :muscles, through: :muscle_machines
end
