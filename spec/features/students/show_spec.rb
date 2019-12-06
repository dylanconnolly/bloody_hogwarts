require 'rails_helper'

RSpec.describe "student show page" do
  it "lists all of the courses that student has" do
    potions = Course.create(name: "Potions")
    herbology = Course.create(name: "Herbology")
    dark_arts = Course.create(name: "Defense Against the Dark Arts")
    hagrid = Course.create(name: "Waste Time with Hagrid")

    bob = Student.create(name: "Bob", age: 12, house: "Ravenclaw")
    tom = Student.create(name: "Tom", age: 14, house: "Hufflepuff")

    potions.students << bob
    dark_arts.students << bob
    hagrid.students << bob
    potions.students << tom
    herbology.students << tom
    hagrid.students << tom

    visit "/students/#{bob.id}"

    expect(page).to have_content("Potions")
    expect(page).to have_content("Defense Against the Dark Arts")
    expect(page).to have_content("Waste Time with Hagrid")
    expect(page).to_not have_content("Herbology")

    visit "/students/#{tom.id}"

    expect(page).to have_content("Potions")
    expect(page).to have_content("Herbology")
    expect(page).to have_content("Waste Time with Hagrid")
    expect(page).to_not have_content("Defense Against the Dark Arts")
  end
end
