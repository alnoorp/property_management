class Building < ActiveRecord::Base
  STATES = %w{AL AK AZ AR CA CO CT DC DE FL GA HI ID IL IN IA KS KY LA
    ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI
    SC SD TN TX UT VT VA WA WV WI WY}
  belongs_to :owner, inverse_of: :buildings
  validates_presence_of :street_address
  validates_inclusion_of :state, in: STATES
  validates_presence_of :city
  validates_format_of :postal_code, with: /\A\d{5}\z/

  def owner_name
    if owner != nil
      owner.full_name
    else
      nil
    end
  end
end
