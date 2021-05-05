class PassingTest < ApplicationRecord
  belongs_to :user
  belongs_to :test

  scope :by_level, ->(level) { joins(:test).where(tests: { level: level }) }
  
end
