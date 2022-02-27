class CreateTrainingWayVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :training_way_videos do |t|
      t.integer :machine_id, null: false
      t.integer :muscle_id, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
