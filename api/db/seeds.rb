# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

now = Time.zone.now

Muscle.destroy_all

muscles = [
  {id: 1, name: '広背筋', image_url: 'https://contents.melos.media/wp-content/uploads/2021/08/26182806/22401009.jpg', created_at: now, updated_at: now }, 
  {id: 2, name: '上腕二頭筋', image_url: 'https://contents.melos.media/wp-content/uploads/2021/11/24165601/2416957.jpg', created_at: now, updated_at: now },
  {id: 3, name: '大胸筋', image_url: 'https://cdn.fily.jp/uploads/articles/i/b40cb755-dcf3-4b20-a0e6-6ec1a8f23488.png', created_at: now, updated_at: now },
  {id: 4, name: '三角筋', image_url: 'https://contents.melos.media/wp-content/uploads/2021/11/24165601/2416957.jpg',  created_at: now, updated_at: now },
  {id: 5, name: '上腕三頭筋', image_url: 'https://contents.melos.media/wp-content/uploads/2021/08/26182806/22401009.jpg',  created_at: now, updated_at: now },
  {id: 6, name: '僧帽筋', image_url: '',  created_at: now, updated_at: now },
  {id: 7, name: '腹筋', image_url: '',  created_at: now, updated_at: now },
  {id: 8, name: '大臀筋', image_url: '',  created_at: now, updated_at: now },
  {id: 9, name: 'ハムストリング', image_url: '',  created_at: now, updated_at: now },
  {id: 10, name: '大腿四頭筋', image_url: '',  created_at: now, updated_at: now },
  {id: 11, name: '内転筋', image_url: '',  created_at: now, updated_at: now },
  {id: 12, name: '下腿三頭筋', image_url: '',  created_at: now, updated_at: now }
]

Muscle.insert_all!(muscles)

Machine.destroy_all

machines = [
  { id: 1, name: 'ラットプルダウン', created_at: now, updated_at: now },
  { id: 2, name: 'ケーブルマシン', created_at: now, updated_at: now },
  { id: 3, name: 'ダンベル', created_at: now, updated_at: now },
  { id: 4, name: 'ショルダープレス', created_at: now, updated_at: now },
  { id: 5, name: 'レッグエクステンション', created_at: now, updated_at: now },
  { id: 6, name: 'チェストプレス', created_at: now, updated_at: now },
  { id: 7, name: 'バラフライマシン', created_at: now, updated_at: now },
  { id: 8, name: 'シーデッドロー', created_at: now, updated_at: now },
  { id: 9, name: 'レッグプレス', created_at: now, updated_at: now },
  { id: 10, name: 'アブドミナルクランチ', created_at: now, updated_at: now },
]

Machine.insert_all!(machines)

MuscleMachine.destroy_all

muscle_machines = [
  { id: 1, muscle_id: 1, machine_id: 1, created_at: now, updated_at: now },
  { id: 2, muscle_id: 2, machine_id: 2, created_at: now, updated_at: now },
  { id: 4, muscle_id: 3, machine_id: 2, created_at: now, updated_at: now },
  { id: 5, muscle_id: 4, machine_id: 2, created_at: now, updated_at: now },
  { id: 6, muscle_id: 5, machine_id: 2, created_at: now, updated_at: now },
  { id: 7, muscle_id: 5, machine_id: 3, created_at: now, updated_at: now },
  { id: 8, muscle_id: 6, machine_id: 8, created_at: now, updated_at: now },
  { id: 9, muscle_id: 7, machine_id: 10, created_at: now, updated_at: now },
  { id: 10, muscle_id: 8, machine_id: 9, created_at: now, updated_at: now },
  { id: 11, muscle_id: 9, machine_id: 9, created_at: now, updated_at: now },
  { id: 12, muscle_id: 10, machine_id: 9, created_at: now, updated_at: now },
  { id: 13, muscle_id: 11, machine_id: 9, created_at: now, updated_at: now },
  { id: 14, muscle_id: 12, machine_id: 9, created_at: now, updated_at: now },
]

MuscleMachine.insert_all!(muscle_machines)

TrainingWayVideo.destroy_all

training_way_vieods = [
  { id: 1, muscle_id: 3, machine_id: 2, url: '<iframe width="100%" height="100%" src="https://www.youtube.com/embed/4-Glg9A4s2M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',created_at: now, updated_at: now },
  { id: 2, muscle_id: 1, machine_id: 1, url: '<iframe width="100%" height="100%" src="https://www.youtube.com/embed/aN98D1YD00o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',created_at: now, updated_at: now },
]

TrainingWayVideo.insert_all!(training_way_vieods)

WorkOut.destroy_all

work_outs = [
  { id: 1, name: 'ベンチプレス', part: 0, muscle_id: 3, created_at: now, updated_at: now },
  { id: 2, name: 'アーノルドプレス', part: 1, muscle_id: 4, created_at: now, updated_at: now },
  { id: 3, name: 'インクラインダンベルカール', part: 2, muscle_id: 2, created_at: now, updated_at: now },
  { id: 4, name: 'ラットプルダウン', part: 3, muscle_id: 1, created_at: now, updated_at: now },
  { id: 5, name: 'バーベルスクワット', part: 4, muscle_id: 9, created_at: now, updated_at: now },
]

WorkOut.insert_all!(work_outs)

WorkOutProperty.destroy_all

work_out_properties = [
  { id: 1, rep: 10, work_out_id: 1, weight_type: 1, interval: 1, created_at: now, updated_at: now },
  { id: 2, rep: 10, work_out_id: 2, weight_type: 1, interval: 1, created_at: now, updated_at: now },
  { id: 3, rep: 10, work_out_id: 3, weight_type: 1, interval: 1, created_at: now, updated_at: now },
  { id: 4, rep: 10, work_out_id: 4, weight_type: 1, interval: 1, created_at: now, updated_at: now },
  { id: 5, rep: 10, work_out_id: 5, weight_type: 1, interval: 1, created_at: now, updated_at: now },
]

WorkOutProperty.insert_all!(work_out_properties)

User.destroy_all

User.create!(password: 'hogehoge', email: 'hoge@example.com')