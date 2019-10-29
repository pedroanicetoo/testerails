class Kind < ActiveRecord::Base
  has_many :contacts
  attr_accessible :description, :contacts_id, :contacts
end
