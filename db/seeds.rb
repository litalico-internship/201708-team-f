# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 検索条件
genders = Gender.create([{ name: "男性" }, { name: "女性" }, { name: "その他" } ])
regions = Region.create([{ name: "東京都" }, { name: "神奈川県" } ])
extents = Extent.create([{ name: "部屋から出てこない" }, 
                         { name: "部屋からは出て来るが家は出ない" }, 
                         { name: "コンビニなど近所への外出はする" } ])
communicatables = Communicatable.create([{ name: "可能" }, { name: "不可能" } ])
interventions = Intervention.create([{ name: "できそう" }, { name: "できなさそう" } ])
spans = Span.create([{ name: "1ヶ月以内" }, { name: "1ヶ月〜6ヶ月"} , { name: "6ヶ月以上" } ])

# ユーザ
users = User.create([{ email: "hogehoge@hoge.com", password: "hogehoge", name: "蒲焼さん太郎" }])

# アドバイザ
adviser1 = Adviser.create(name: "相談受け太郎", min_age: 8, max_age: 20, day: 1, start_time: '12:00', end_time: '17:00', avator: open("#{Rails.root}/db/data/adviser1.png"))
adviser1.genders << genders
adviser1.regions << Region.find_by(name: "東京都")
adviser1.extents << extents
adviser1.communicatables << communicatables
adviser1.interventions << interventions
adviser1.spans << spans

adviser2 = Adviser.create(name: "相談受け子", min_age: 12, max_age: 24, day: 3, start_time: '12:00', end_time: '17:00', avator: open("#{Rails.root}/db/data/adviser2.png"))
adviser2.genders << genders
adviser2.regions << Region.find_by(name: "東京都")
adviser2.extents << extents
adviser2.communicatables << communicatables
adviser2.interventions << interventions
adviser2.spans << spans

# 予約
user = users.first
user.reservations.build(adviser_id: adviser1.id, start_time: Time.new(2017, 8, 19, 13), status: 0).save
user.reservations.build(adviser_id: adviser2.id, start_time: Time.new(2017, 8, 20, 15), status: 0).save

# 評価
user.rates.build(adviser_id: adviser1.id, rate: 5).save
