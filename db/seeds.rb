# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Farm.all.delete_all
Animal.all.delete_all
Owner.all.delete_all
Comment.all.delete_all

#Farms

farm1 = Farm.new(name: "Billy's Ranch")
farm2 = Farm.new(name: "Joe's Ranch")
farm3 = Farm.new(name: "Adam's Ranch")
farm4 = Farm.new(name: "Alan's Ranch")
farm5 = Farm.new(name: "Noname's Ranch")
farm6 = Farm.new(name: "Jane's Ranch")
farm7 = Farm.new(name: "Canyon Ranch")
farm8 = Farm.new(name: "Bluewater Ranch")

farm9 = Farm.new(name: "Redneck's Ranch")
farm10 = Farm.new(name: "Mary's Ranch")
farm11 = Farm.new(name: "McGregor's Ranch")
farm12 = Farm.new(name: "McCleary's Ranch")
farm13 = Farm.new(name: "Duck Farm")
farm14 = Farm.new(name: "Chicken Farm")
farm15 = Farm.new(name: "Rabbit Farm")
farm16 = Farm.new(name: "Angus Farm")

owner1 = Owner.new(name: "Admin" ,admin: true , money: 0 , password: "1234")
owner1.save
owner2 = Owner.new(name: "Justin", money: 40000 , password: "1234")
owner2.save
owner3 = Owner.new(name: "John", money: 50000 , password: "1234")
owner3.save
owner4 = Owner.new(name: "Ed", money: 35000 , password: "1234")
owner4.save
owner5 = Owner.new(name: "Ethan", money: 57000 , password: "1234")
owner5.save




farm1.animals.build(name: "Cow" , unit_price: 1100 , quantity: 7)
farm1.save


farm2.animals.build(name: "Angus" , unit_price: 900 , quantity: 4)
farm2.animals.build(name: "Cow" , unit_price: 1100 , quantity: 5)
farm2.save

farm3.animals.build(name: "Chicken" , unit_price: 9 , quantity: 200)
farm3.animals.build(name: "Cow" , unit_price: 1100 , quantity: 5)
farm3.save

farm4.animals.build(name: "Chicken" , unit_price: 9 , quantity: 400)
farm4.animals.build(name: "Angus" , unit_price: 900 , quantity: 9)
farm4.save



farm5.animals.build(name: "Cow" , unit_price: 1100 , quantity: 13)
farm5.save

farm6.animals.build(name: "Angus" , unit_price: 900 , quantity: 4)
farm6.animals.build(name: "Cow" , unit_price: 1100 , quantity: 5)
farm6.save

farm7.animals.build(name: "Duck" , unit_price: 11 , quantity: 200)
farm7.animals.build(name: "Cow" , unit_price: 1100 , quantity: 7)
farm7.save

farm8.animals.build(name: "Chicken" , unit_price: 9 , quantity: 25)
farm8.animals.build(name: "Angus" , unit_price: 900 , quantity: 11)
farm8.save



farm9.animals.build(name: "Cow" , unit_price: 1100 , quantity: 13)
farm9.save

farm10.animals.build(name: "Angus" , unit_price: 900 , quantity: 3)
farm10.animals.build(name: "Cow" , unit_price: 1100 , quantity: 12)
farm10.save



farm11.animals.build(name: "Chicken" , unit_price: 9 , quantity: 400)
farm11.animals.build(name: "Angus" , unit_price: 900 , quantity: 9)
farm11.save



farm12.animals.build(name: "Cow" , unit_price: 1100 , quantity: 11)
farm12.save


farm13.animals.build(name: "Duck" , unit_price: 11 , quantity: 400)
farm13.save


farm14.animals.build(name: "Chicken" , unit_price: 9 , quantity: 125)
farm14.save


farm15.animals.build(name: "Rabbit" , unit_price: 15 , quantity: 87)
farm15.save

farm16.animals.build(name: "Angus" , unit_price: 900 , quantity: 17)
farm16.save

owner2.farms << farm1
owner2.farms << farm2
owner2.save

owner3.farms << farm3
owner3.farms << farm4
owner3.save


owner3.farms << farm5
owner3.farms << farm6
owner3.save

owner4.farms << farm7
owner4.farms << farm8
owner4.save
