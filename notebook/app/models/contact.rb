class Contact < ActiveRecord::Base
  belongs_to :kind
  attr_accessible :email, :name, :rmk
end
