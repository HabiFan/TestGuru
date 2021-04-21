class User < ApplicationRecord

  def level_by_tests(level)
    Test.joins('INNER JOIN passing_tests ON tests.id = passing_tests.test_id')
        .where('passing_tests.user_id = ?', id)
        .where(level: level)
  end

end
