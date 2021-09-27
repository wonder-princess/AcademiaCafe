# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

50.times do |n|
  name_a = Gimei.kanji
  name_b = Gimei.kanji
  kind = rand(1..3)

  Community.create!(
    title: name_a, 
    introduction: name_b,
    kind: kind, 
    user_id: 1
  )
end