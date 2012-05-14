class User < ActiveRecord::Base
  has_many :responces
 # attr_accessor :password
  attr_accessible :usename, :password, :ownername

  validates :usename, :presence => true,
            :length       => { :within => 4..20 }
                       

  def self.authenticate(usename, submitted_password)
    user = find_by_usename(usename)
    return nil  if user.nil?
    pass=user.password
    return user if pass.eql?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user) ? user : nil
  end
end
