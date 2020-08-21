# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
require 'open-uri'
require 'json'


Cake.destroy_all
Request.destroy_all
User.destroy_all

user = User.create(
  email: 'test@test.test',
  password: '123456',
)

Cake.create([{
  user_id: user.id,
  name: "Summer Berry Grunt",
  description: "The line between cobbler and grunt is a fine one, but essentially a grunt is a cobbler that's slow-cooked on the stovetop.",
  ingredients: " blackberries, blueberries, fresh lemon juice, cinnamon, vanilla",
  available_slices: 8,
  calculated_slices: 8,
  requested_compensation: "Time, coffee, just a smile",
  eat_by: DateTime.now.tomorrow.to_date
},

{
  user_id: user.id,
  name: "Tiny Raspberry Fools",
  description: "Fools are old-fashioned English desserts with loads of bright, tangy flavor.",
  ingredients: "rasberry, ",
  available_slices: 2,
  calculated_slices: 2,
  requested_compensation: "coffee, just a smile",
  eat_by: Date.tomorrow
},
{
  user_id: user.id,
  name: "Spotted Dog Pudding",
  description: "Classic English pudding usually results in a smile or look of horror, which is why some people prefer the dish's alternative name, 'Spotted Dick'.",
  ingredients: "Raisin, currants, lemon zest, bacon",
  available_slices: 8,
  calculated_slices: 8,
  requested_compensation: "money, eggs, time",
  eat_by: Date.today
},
{
  user_id: user.id,
  name: "Old-Fashioned Apple Pandowdy",
  description: "The pandowdy is another cobbler variation with a crumbly crust that's broken up by the juices of the fruit as it cooks",
  ingredients: "Molasse, lemon juice, cinnamon, vanilla, granny smith apples, nutmeg, crumble.",
  available_slices: 6,
  calculated_slices: 6,
  requested_compensation: "money, money, money.",
  eat_by: Date.tomorrow
},
{
  user_id: user.id,
  name: "Singin' Hinnies",
  description: "Lovely, sweet griddle cakes that sizzle and sing as they hit the pan. Hinney is how 'honey' is pronounced in Northeast England..",
  ingredients: "Cream of tartar, dried fruit (currants, sultanas, and raisins), serving Suggestions: butter, granulated sugar",
  available_slices: 10,
  calculated_slices: 10,
  requested_compensation: "Time, just a smile",
  eat_by: DateTime.now.tomorrow.to_date
},
])

cakes = Cake.all

cakes.each do |cake|
  file = URI.open("https://source.unsplash.com/900x900/?#{cake.name}")
  cake.photo.attach(io: file, filename: 'bd.jpg', content_type: 'image/jpg')
  cake.save
end
