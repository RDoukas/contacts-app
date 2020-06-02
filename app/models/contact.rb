class Contact < ApplicationRecord

  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")
  end
  
  def full_name
    full_name = "#{first_name} #{last_name}"
  end 
  
  def japanese_number
    japanese_number = "+81 "
    japanese_number += phone_number
  end 

end
