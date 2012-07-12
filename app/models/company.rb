class Company < ActiveRecord::Base
  attr_accessible :address, :addresstwo, :city, :name, :notes, :postalcode, :state, :website, :user_id
  has_many :projects, :dependent => :destroy
end
