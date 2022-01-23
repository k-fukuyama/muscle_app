class Muscle < ApplicationRecord
  has_many :muscle_machines
  has_many :machines, through: :muscle_machines
end
