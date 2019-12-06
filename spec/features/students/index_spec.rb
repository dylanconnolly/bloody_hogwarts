require 'rails_helper'

RSpec.describe "student index page" do
  it "displays all students with their name, age, and house" do
    bob = Student.create(name: "Bob", age: 12, house: "Ravenclaw")
    tom = Student.create(name: "Tom", age: 14, house: "Hufflepuff")

    visit '/students'

    expect(page).to have_content("Bob")
    expect(page).to have_content("12")
    expect(page).to have_content("Ravenclaw")
    expect(page).to have_content("Tom")
    expect(page).to have_content("14")
    expect(page).to have_content("Hufflepuff")
  end

  it "displays the average age of the students" do
    bob = Student.create(name: "Bob", age: 12, house: "Ravenclaw")
    tom = Student.create(name: "Tom", age: 14, house: "Hufflepuff")

    visit '/students'

    expect(page).to have_content("Average age: 13")
  end

  it "displays the students in alphabetical order" do
    tom = Student.create(name: "Tom", age: 14, house: "Hufflepuff")
    bob = Student.create(name: "Bob", age: 12, house: "Ravenclaw")

    visit '/students'

    page.body.index(bob.name).should < page.body.index(tom.name)
  end
end
