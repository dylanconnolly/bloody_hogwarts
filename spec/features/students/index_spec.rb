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
end
