require 'rails_helper'

RSpec.feature "user can search for a store location" do
  scenario "any user can search by zipcode" do
    VCR.use_cassette("user stores") do
      visit "/"
      fill_in :search, with: "80202"
      click_button "Search"

      expect(current_path).to eq("/search")
      expect(page).to have_content("17 Total Stores")
      expect(page).to have_content("15 Results")
      expect(page).to have_selector('.store', count: 15)
      expect(page).to have_content("Name: Cherry Creek Shopping Center")
      expect(page).to have_content("City: Denver")
      expect(page).to have_content("Distance: 3.25")
      expect(page).to have_content("Phone Number: 303-270-9189")
      expect(page).to have_content("Store Type: Mobile")
    end
  end
end
