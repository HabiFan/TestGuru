module TestPassagesHelper

  def show_number_question(current_question)
    t('.question_number', 
      q_number: @test_passage.current_question_number(current_question), 
      q_count: @test_passage.test.questions.count)   
  end

  def show_test_result(passed=false)
    if passed
      "<h2 class='passed'>#{t('.test_passed')}</h2>".html_safe
    else
      "<h2 class='failed'>#{t('.test_failed')}</h2>".html_safe
    end
  end
  
end
