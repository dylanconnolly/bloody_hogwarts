require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe "#average_age" do
    it "returns the average age of all students" do
      bob = Student.create(name: "Bob", age: 12, house: "Ravenclaw")
      tom = Student.create(name: "Tom", age: 14, house: "Hufflepuff")
      sam = Student.create(name: "Sam", age: 17, house: "Slytherin")

      expect(Student.average_age).to eq (14.33)
    end
  end

end
