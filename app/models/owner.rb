class Owner < ActiveRecord::Base
  has_many :tickets
end
