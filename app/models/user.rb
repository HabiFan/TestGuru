class User < ApplicationRecord

  has_many :passing_tests, dependent: :destroy
  has_many :tests, through: :passing_tests
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :first_name, :password, :email, presence: true

  def level_by_tests(level)
    passing_tests.by_level(level)
  end

end
