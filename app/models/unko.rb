class Unko < ActiveRecord::Base
  validates :name, :greeting, presence: true, length: {maximum: 100}
end
