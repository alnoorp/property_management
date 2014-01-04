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

  scenario 'required information is supplied'
  scenario 'required information is not supplied'

end
