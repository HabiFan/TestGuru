class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :passing_tests, dependent: :destroy
  has_many :users, through: :passing_tests

  class << self
    def tests_by_categories(title)
      joins('INNER JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: title })
      .order(title: :desc).pluck(:title)
    end
  end
end
