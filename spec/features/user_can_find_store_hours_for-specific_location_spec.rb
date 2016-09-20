require 'rails_helper'

RSpec.feature "user can see store hours" do
  scenario "any user can see a specific store's hours" do
    VCR.use_cassette("hours") do
      visit "/"
      fill_in :search, with: "80202"
      click_button "Search"

      click_link("Cherry Creek Shopping Center")

      expect(current_path).to eq("/stores/:store_id")
      expect(page).to have_content("Cherry Creek Shopping Center")
      expect(page).to have_content("Mobile")
      expect(page).to have_content("Address")
      expect(page).to have_content("Colorado")
      expect(page).to have_content("80202")
      within("ol") do
        expect(page).to have_content("* Mon: 10am-9pm")
      end
    end
  end
end



# As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"
# I should see the store name, store type and address with city, state and zip
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
#   * Tue: 10am-9pm
#   * Wed: 10am-9pm
#   * Thurs: 10am-9pm
#   * Fri: 10am-9pm
#   * Sat: 10am-9pm
