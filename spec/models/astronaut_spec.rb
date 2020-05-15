require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'class methods' do
    it 'can average age' do
      astronaut_1 = Astronaut.create!(name:"Neil Armstrong",age:48,job:"commander")
      astronaut_2 = Astronaut.create!(name:"John Glenn",age:44,job:"copilot")
      astronaut_3 = Astronaut.create!(name:"Eric Boe",age:40,job:"noone knows")

      expect(Astronaut.average_age).to eq(44)
    end
  end
end
