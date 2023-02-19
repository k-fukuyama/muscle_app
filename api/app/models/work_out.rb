class WorkOut < ApplicationRecord
  enum status:{ 
    chest: 0,
    shoulder: 1,
    arm: 2,
    back: 3,
    leg: 4
  }
end
