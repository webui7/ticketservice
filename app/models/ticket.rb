class Ticket < ActiveRecord::Base
  has_many :responces
  belongs_to :status
  belongs_to :department
  belongs_to :user
  belongs_to :owner
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true,
            :length       => { :within => 4..20 }
  validates :requestbody, :presence => true,
            :length       => { :within => 4..400 }
  validates :subject, :presence => true,
            :length       => { :within => 0..150 }                       
  validates :email, :presence => true,
            :format   => { :with => email_regex }
end