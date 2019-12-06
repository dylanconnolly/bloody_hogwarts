require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe "#student_count" do
    it "returns number of students in course" do
    potions = Course.create(name: "Potions")

    bob = Student.create(name: "Bob", age: 12, house: "Ravenclaw")
    tom = Student.create(name: "Tom", age: 14, house: "Hufflepuff")
    sam = Student.create(name: "Sam", age: 17, house: "Slytherin")

    expect(potions.student_count).to eq(0)

    potions.students << bob

    expect(potions.student_count).to eq(1)

    potions.students << tom
    potions.students << sam

    expect(potions.student_count).to eq(3)
    end
  end
end
