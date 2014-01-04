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
  # * If I do not specify all of the required inforamtion in the required
  #   formats, the building is not recorded and I am presented with errors
  # * Upon successfully creating a building, I am redirected so that I
  #   can record another building

  scenario 'required information is supplied in required format'
  scanario 'non-US state is supplied'
  scenario 'required information is not supplied'

end
