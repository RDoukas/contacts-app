class Contact < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}


  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")
  end
  
  def full_name
    full_name = "#{first_name} #{middle_name} #{last_name}"
  end 
  
  def japanese_number
    japanese_number = "+81 "
    japanese_number += phone_number
  end 

  def address 
    Geocoder.search([latitude, longitude]).first.address
  end 

end
