class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  #  devise :database_authenticatable, :registerable,
  #         :recoverable, :rememberable, :trackable, :validatable
  
    # Setup accessible (or protected) attributes for your model
  #  attr_accessible :email, :password, :password_confirmation, :remember_me, :login
  
  has_many :shares, :dependent => :destroy
  has_many :projects, :through => :shares, :dependent => :destroy
  
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
  	user = User.where("email = ? or login = ?",login,login).first
  	user if !user.nil? && password == user.password
  end
end
