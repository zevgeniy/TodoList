class Project < ActiveRecord::Base

has_many :shares, :dependent => :destroy
has_many :users, :through => :shares

has_many :lists, :dependent => :destroy

validates :name, 	:presence => true

def author
  User.find_by_id(shares.select(:user_id).where("author == ?",true))
end

end
