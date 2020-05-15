# As a visitor,
# When I visit '/astronauts'
# I see the average age of all astronauts.


RSpec.describe 'as a visitor' do
  describe 'when i visit /astronauts' do
    it 'I see a list of astronauts with their name,age,job' do
      astronaut_1 = Astronaut.create!(name:"Neil Armstrong",age:55,job:"commander")
      astronaut_2 = Astronaut.create!(name:"John Glenn",age:44,job:"copilot")
      astronaut_3 = Astronaut.create!(name:"Eric Boe",age:40,job:"noone knows")


      visit '/astronauts'

      within "#astronaut-#{astronaut_1.id}" do
        expect(page).to have_content(astronaut_1.name)
        expect(page).to have_content(astronaut_1.age)
        expect(page).to have_content(astronaut_1.job)
      end
      within "#astronaut-#{astronaut_2.id}" do
        expect(page).to have_content(astronaut_2.name)
        expect(page).to have_content(astronaut_2.age)
        expect(page).to have_content(astronaut_2.job)
      end
      within "#astronaut-#{astronaut_3.id}" do
        expect(page).to have_content(astronaut_3.name)
        expect(page).to have_content(astronaut_3.age)
        expect(page).to have_content(astronaut_3.job)
      end
    end

    it 'i can see the average age of all astronauts' do
      astronaut_1 = Astronaut.create!(name:"Neil Armstrong",age:55,job:"commander")
      astronaut_2 = Astronaut.create!(name:"John Glenn",age:44,job:"copilot")
      astronaut_3 = Astronaut.create!(name:"Eric Boe",age:40,job:"noone knows")

      visit '/astronauts'

      expect(page).to have_content("Average age: 46")
    end

#     When I visit '/astronauts'
# I see a list of the space missions' in alphabetical order for each astronaut.
#
# (e.g "Apollo 13"
#      "Capricorn 4"
#      "Gemini 7")
     it 'i see a list of space missions in alphabetical order for each astronaut' do
       astronaut_1 = Astronaut.create!(name:"Neil Armstrong",age:55,job:"commander")
       astronaut_2 = Astronaut.create!(name:"John Glenn",age:44,job:"copilot")
       astronaut_3 = Astronaut.create!(name:"Eric Boe",age:40,job:"noone knows")
       mission_2 = Mission.create!(title: "Gemini 7", time_in_space: 200)
       mission_1 = Mission.create!(title: "Apollo 13", time_in_space: 400)
       mission_3 = Mission.create!(title: "Capricorn 4", time_in_space: 300)
       AstronautMission.create!(astronaut: astronaut_1, mission: mission_1)
       AstronautMission.create!(astronaut: astronaut_1, mission: mission_2)
       AstronautMission.create!(astronaut: astronaut_2, mission: mission_3)
       AstronautMission.create!(astronaut: astronaut_3, mission: mission_1)
       AstronautMission.create!(astronaut: astronaut_3, mission: mission_3)
       visit '/astronauts'
       # save_and_open_page
      within "#astronaut-#{astronaut_1.id}" do
        within "#missions" do
          expect("Apollo 13").to appear_before("Gemini 7")
        end
        expect(page).to have_content("Total Time In Space: 600 days")
      end

      within "#astronaut-#{astronaut_2.id}" do
        within "#missions" do
          expect(page).to have_content("Capricorn 4")
        end
        expect(page).to have_content("Total Time In Space: 300 days")
      end

      within "#astronaut-#{astronaut_3.id}" do
        within "#missions" do
          expect("Apollo 13").to appear_before("Capricorn 4")
        end
        expect(page).to have_content("Total Time In Space: 700 days")
      end

     end
  end
end
