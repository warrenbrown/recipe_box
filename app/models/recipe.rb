class Recipe < ActiveRecord::Base
  validates :title, :description, presence: true
end
