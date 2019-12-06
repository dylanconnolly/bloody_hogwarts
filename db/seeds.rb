# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
potions = Course.create(name: "Potions")
herbology = Course.create(name: "Herbology")
dark_arts = Course.create(name: "Defense Against the Dark Arts")
hagrid = Course.create(name: "Waste Time with Hagrid")

bob = Student.create(name: "Bob", age: 12, house: "Ravenclaw")
tom = Student.create(name: "Tom", age: 14, house: "Hufflepuff")
sam = Student.create(name: "Sam", age: 17, house: "Slytherin")

potions.students << bob
dark_arts.students << bob
hagrid.students << bob
potions.students << tom
herbology.students << tom
hagrid.students << tom

potions.students << sam
