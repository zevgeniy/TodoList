class List < ActiveRecord::Base

belogns_to :project
has_many :tasks

validates :name, :presence => true

end
