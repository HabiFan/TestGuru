module TestPassagesHelper

  def show_number_question(current_question)
    "Question (#{@test_passage.current_question_number(current_question)} /
    #{@test_passage.test.questions.count})"
  end

  def show_test_result(passed=false)
    passed ? 'passed' : 'failed'
  end
  
end
