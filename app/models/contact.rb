class Contact < ApplicationRecord


  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  belongs_to :user
  has_many :contact_groups
  has_many :groups, through: :contact_groups

  def friendly_updated_at
    updated_at.strftime("%m/%d/%Y")
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def japan_phone_number
    "+81 #{phone_number}"
  end

  def geocode_address
    Geocoder.search([latitude, longitude]).first.address
  end

  def group_names
    groups.map { |group| group.name}
  end


end