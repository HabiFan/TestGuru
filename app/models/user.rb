class User < ApplicationRecord

  has_many :passing_tests, dependent: :destroy
  has_many :tests, through: :passing_tests
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  def level_by_tests(level)
    Test.joins(:passing_tests)
        .where(passing_tests: { user_id: id })
        .where(level: level)
  end

end
