class Contact < ActiveRecord::Base
  belongs_to :kind
  has_one :address

  attr_accessible :email, :name, :rmk, :kind, :address_attributes

  accepts_nested_attributes_for :address
end
