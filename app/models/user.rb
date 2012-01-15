class User < ActiveRecord::Base

has_many :projects

validates :login, 	:presence => true,
					:length => {:minimum => 3, :maximum => 12},
					:uniqueness => true,
					:format => /[\w]/
					
validates :email,	:presence => true,
					:format => /\A([\w\.]){3,}@([\w\.]){2,}\.([A-Za-z]){2,}\z/,
					:uniqueness => true
					
validates :password,:presence => true, 
					:confirmation => true,
					:length => { :minimum => 5 },
					:format => /\A[\w]+\z/

validates :password_confirmation, :presence => true

def self.authenticate login, password
	user = User.where("email = '#{login}' or login = '#{login}'").first
	if !user.nil?
		if password == user.password
			user
		else
			nil
		end
	else
		nil
	end
end


end
