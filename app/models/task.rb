class Task < ActiveRecord::Base
  belongs_to :list
  attr_accessible :complete, :name, :due_at

  validates :name, presence: true
end
