class Machine < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :muscle_machines
  has_many :muscles, through: :muscle_machines
  has_many :videos, class_name: 'TrainingWayVideo'

  def video_urls_by_muscle_id(muscle_id)
    videos.where(muscle_id: muscle_id).pluck(:url)
  end
end
