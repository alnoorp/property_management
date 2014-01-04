require 'spec_helper'

feature 'user adds an owner', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

  # Acceptance Criteria
  # * I must specify a first name, last name, and email address
  # * I can optionally specify a company name
  # * If I do not specify the required information,
  #   I am presented with errors
  # * If I specify the required information, the owner is recorded
  #   and I am redirected to enter another record

  scenario 'required information is supplied' do
    visit owners_path
    click_on 'Add Owner'
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'john.smith@gmail.com'
    fill_in 'Company', with: 'XYZ Company'
    click_on 'Save Owner'

    expect(page).to have_content 'Owner successfully saved'
    expect(page).to have_content 'John'
    expect(page).to have_content 'Smith'
    expect(page).to have_content 'john.smith@gmail.com'
    expect(page).to have_content 'XYZ Company'
    expect(page).to have_content 'Owner Listing'
    expect(page).to have_content 'Add Owner'
  end

  scenario 'required information is not supplied' do
    visit owners_path
    click_on 'Add Owner'
    click_on 'Save Owner'

    within '.input.owner_first_name' do
      expect(page).to have_content "can't be blank"
    end

    within '.input.owner_last_name' do
      expect(page).to have_content "can't be blank"
    end

    within '.input.owner_email' do
      expect(page).to have_content "is invalid"
    end
  end
end
