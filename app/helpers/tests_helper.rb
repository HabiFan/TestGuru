module TestsHelper

  TEST_LEVELS = { 0 => :easy, 1 => :elementry, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def test_header(test)
    if test.new_record?
      t('.create_test')
    else
      t('.edit_test')
    end
  end
end
