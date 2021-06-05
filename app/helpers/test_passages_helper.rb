module TestPassagesHelper

  def show_number_question(current_question)
    "Question (#{@test_passage.current_question_number(current_question)} /
    #{@test_passage.test.questions.count})"
  end
end
