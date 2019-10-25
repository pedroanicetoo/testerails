class Address < ActiveRecord::Base
  belongs_to :contact
  attr_accessible :city, :state, :street
end
