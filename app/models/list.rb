class List < ActiveRecord::Base

belongs_to :project
has_many :tasks, :dependent => :destroy

validates :name, :presence => true

end
