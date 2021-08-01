class BadgeCheckService
  attr_reader :user, :test_passage

  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
  end

  def call
    received_badges = []
    Badge.all.each do |badge|
      received_badges << badge if send("passed_#{badge.rule.kind}?", badge.rule.value)
    end
    user.badges.push(received_badges)
    received_badges.map(&:name)
  end

  private

  def passed_first_try?(_value)
    user.test_passages.where(test: test_passage.test).count == 1
  end

  def passed_all_tests_by_category?(category_id)
    category = Category.find_by(id: category_id)
    return false if category.blank?
    return false if category.id != test_passage.test.category_id

    passed_test_ids = successfull_tests.in_category(category).pluck(:test_id)

    passed_test_ids == category.tests.order(:id).ids
  end

  def passed_all_tests_by_level?(level)
    return false if level.blank?
    return false unless level == test_passage.test.level

    passed_test_ids = successfull_tests.by_level(level).pluck(:test_id)

    passed_test_ids == Test.level(level).order(:id).ids
  end

  def successfull_tests
    user.test_passages.succeeded.distinct(:test_id).order(:test_id)
  end
end