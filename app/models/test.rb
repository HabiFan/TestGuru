class Test < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy
  belongs_to :category
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :level, ->(level) { where(level: level) }
  scope :simple, -> { level(0..1) }
  scope :medium, -> { level(2..4) }
  scope :difficult, -> { level(5..Float::INFINITY) }

  class << self
    def by_category(title)
      joins(:category)
      .where(categories: { title: title })
      .order(title: :desc)
    end

    def tests_by_categories(title)
      by_category(title).pluck(:title)
    end
  end
end
