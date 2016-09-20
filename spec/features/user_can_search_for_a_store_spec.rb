# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results

require 'rails_helper'

RSpec.feature "user can search for a store location" do
  scenario "any user can search by zipcode" do
    visit "/"
    fill_in :search, with: "80202"
    click_button "Search"

    expect(current_path).to eq("/search")
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_content("15 Results")
    expect(page).to have_selector('.store', count: 15)
    expect(page).to have_content("Name: ")
    expect(page).to have_content("Distance: ")
    expect(page).to have_content("Phone Number: ")
    expect(page).to have_content("Store Type: ")
  end
end
