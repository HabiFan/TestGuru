class Test < ApplicationRecord
  class << self
    def tests_by_categories(title)
      joins('INNER JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: title })
      .order(title: :desc).pluck(:title)
    end
  end
end
