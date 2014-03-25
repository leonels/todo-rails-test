class List < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  attr_accessible :title, :tasks_attributes
  accepts_nested_attributes_for :tasks, :reject_if => lambda { |t| t[:name].blank?}, allow_destroy: true

  validates :title, presence: true

end
