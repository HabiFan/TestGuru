class Test < ApplicationRecord
  class << self
    def tests_by_categories(title)
      Test.joins('LEFT JOIN categories ON tests.category_id = categories.id')
          .where('categories.title = ?', title)
          .order(id: :desc)
    end
  end
end
