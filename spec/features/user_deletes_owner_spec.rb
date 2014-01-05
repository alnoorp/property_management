require 'spec_helper'

feature 'user deletes owner', %Q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do

  # Acceptance Criteria
  # * If I delete an owner, the owner and its primary key should
  #   no longer be associated with any properties

  scenario 'user deletes an owner' do
    owner = FactoryGirl.create(:owner)
    building = FactoryGirl.create(:building, owner_id: owner.id)

    visit owners_path
    within "div##{owner.id}" do
      click_on 'Delete'
    end

    expect(page).to have_content 'Owner deleted'
    expect(page).to_not have_content owner.first_name
    expect(page).to_not have_content owner.last_name
    expect(page).to_not have_content owner.email
  end
end
