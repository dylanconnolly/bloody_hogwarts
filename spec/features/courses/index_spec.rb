require 'rails_helper'

RSpec.describe "course index page" do
  it "lists each course name and number of students enrolled in that course" do
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

    visit "/courses"

    expect(page).to have_content("Potions: 2")
    expect(page).to have_content("Defense Against the Dark Arts: 1")
    expect(page).to have_content("Waste Time with Hagrid: 2")
    expect(page).to have_content("Herbology: 1")

    potions.students << sam

    visit "/courses"

    expect(page).to have_content("Potions: 3")
  end

  it "lists the courses alphabetically" do
    potions = Course.create(name: "Potions")
    herbology = Course.create(name: "Herbology")
    dark_arts = Course.create(name: "Defense Against the Dark Arts")
    hagrid = Course.create(name: "Waste Time with Hagrid")

    page.body.index(dark_arts.name).should < page.body.index(herbology.name)
    page.body.index(herbology.name).should < page.body.index(potions.name)
    page.body.index(potions.name).should < page.body.index(hagrid.name)

  end
end
