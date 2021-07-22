puts '初期データ削除'
User.destroy_all
Exercise.destroy_all
Article.destroy_all

puts '初期データ投入'

User.create!(
  [
    {
      name: '田中',
      email: 'tanaka@example.com',
      password: 'password',
      password_confirmation: 'password',
      objective: '毎日運動をする習慣をつける',
      profile_image: File.open('./public/images/img.png''),
      level: 3
    },
    {
      name: 'Miya',
      email: 'miya@example.com',
      password: 'password',
      password_confirmation: 'password',
      objective: '毎日5分運動をする',
      profile_image: File.open('./public/images/icon.jpg'),
      level: 3
    },
    {
      name: 'マツダ',
      email: 'matuda@example.com',
      password: 'password',
      password_confirmation: 'password',
      objective: '3ヶ月で体重5kg減量する',
      level: 1
    },
    {
      name: 'スガワラ',
      email: 'sugawara@example.com',
      password: 'password',
      password_confirmation: 'password',
      objective: '筋肉率37%へアップする（あと7%）',
      level: 2
    },
  ]
)
user1 = User.first
user2 = User.second
user3 = User.third
user4 = User.fourth

puts 'usersテーブルにデータ投入完了'

Exercise.create!(name: 'ストレッチ', user_id: user1.id)
Exercise.create!(name: '有酸素運動', user_id: user1.id)
Exercise.create!(name: '腹筋', user_id: user1.id)
Exercise.create!(name: 'スクワット', user_id: user1.id)

exercise1 = Exercise.first
exercise2 = Exercise.second
exercise3 = Exercise.third
exercise4 = Exercise.fourth

puts 'exercisesテーブルにデータ投入完了'

Article.create!(day: '2021-07-23', minutes: 5, body: '今日から積み上げます！', exercise_id: exercise1.id, user_id: user1.id)
Article.create!(day: '2021-07-23', minutes: 15, body: 'コツコツ毎日積み上げ☺', exercise_id: exercise2.id, user_id: user2.id)
Article.create!(day: '2021-07-24', minutes: 10, body: '今日から積み上げ〜', exercise_id: exercise3.id, user_id: user3.id)
Article.create!(day: '2021-07-23', minutes: 20, body: '初投稿〜。続けよう！', exercise_id: exercise4.id, user_id: user4.id)
Article.create!(day: '2021-07-24', minutes: 15, body: '今日も積み上げ', exercise_id: exercise4.id, user_id: user4.id)
Article.create!(day: '2021-07-25', minutes: 20, body: '腹筋きつかった〜！', exercise_id: exercise3.id, user_id: user2.id)
Article.create!(day: '2021-07-26', minutes: 10, body: '筋肉痛でも積み上げ！', exercise_id: exercise2.id, user_id: user2.id)
Article.create!(day: '2021-07-27', minutes: 20, body: '今日も頑張ったよ〜。', exercise_id: exercise3.id, user_id: user2.id)

puts 'Articlesテーブルにデータ投入完了'