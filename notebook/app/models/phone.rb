class Phone < ActiveRecord::Base
  belongs_to :contact
  attr_accessible :phone, :contact
end
