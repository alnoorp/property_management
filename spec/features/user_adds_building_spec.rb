require 'spec_helper'

feature 'user adds building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

  # Acceptance Criteria
  # * I must specify a street address, city, state, and postal code
  # * Only US states can be specified
  # * I can optionally specify a description of the building
  # * If I enter all of the required information in the required format,
  #   the building is recorded
  # * If I do not specify all of the required information in the required
  #   formats, the building is not recorded and I am presented with errors
  # * Upon successfully creating a building, I am redirected so that I
  #   can record another building
  # * When recording a building, I want to optionally associate
  #   the building with its rightful owner

  scenario 'required information is supplied in required format' do
    Owner.create!(first_name: 'John', last_name: 'Smith',
      email: 'john.smith@email.com')

    visit buildings_path
    click_link 'Add Building'
    fill_in 'Street Address', with: '123 Any Street'
    fill_in 'City', with: 'Springfield'
    select 'MA', from: 'State'
    fill_in 'Postal Code', with: '02456'
    select 'John Smith', from: 'Owner'
    fill_in 'Description', with: 'Not just any building'
    click_button 'Save Building'

    expect(page).to have_content 'Building successfully saved'
    expect(page).to have_content '123 Any Street'
    expect(page).to have_content 'Springfield'
    expect(page).to have_content 'MA'
    expect(page).to have_content '02456'
    expect(page).to have_content 'Not just any building'
    expect(page).to have_content 'Add Building'
    expect(page).to have_content 'Building Listing'
  end

  scenario 'required information is not supplied' do
    visit buildings_path
    click_link 'Add Building'
    click_button 'Save Building'

    within '.input.building_street_address' do
      expect(page).to have_content "can't be blank"
    end

    within '.input.building_city' do
      expect(page).to have_content "can't be blank"
    end

    within '.input.building_state' do
      expect(page).to have_content "is not included in the list"
    end

    within '.input.building_postal_code' do
      expect(page).to have_content "is invalid"
    end

    expect(page).to_not have_content 'Building successfully saved'
  end
end
