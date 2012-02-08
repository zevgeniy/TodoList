class User < ActiveRecord::Base

has_many :shares
has_many :projects, :through => :shares

has_and_belongs_to_many :tasks

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

def shared_projects
  Project.where(:id => shares.select(:project_id).where(:author=>false))
end

def my_projects
  Project.where(:id => shares.select(:project_id).where(:author=>true))
end

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
