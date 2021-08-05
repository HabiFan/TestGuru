class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 85
  
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  scope :succeeded, -> { where(succeeded: true) }
  scope :by_level, ->(level) { joins(:test).where(tests: { level: level }) }
  scope :in_category, ->(category) { joins(:test).where(tests: { category_id: category.id }) }

  def lasting
    @lasting ||= test.lasting
  end

  def timer_end_time
    created_at + lasting.minutes if lasting
  end

  def time_end?
    test.timer? && Time.current > timer_end_time
  end


  def current_question_number(current_question)
    test.questions.order(:id).pluck(:id).index(current_question.id) + 1
  end

  def total_percent_correct_answers
    (correct_questions * 100) / test.questions.count
  end

  def completed?
    current_question.nil? || time_end?
  end

  def successfull?
    total_percent_correct_answers >= SUCCESS_RATIO 
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def after_complete(question)
    self.succeeded = successfull? if question.nil?
  end


  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_next_question
    after_complete(next_question)
    self.current_question = next_question
    
  end
end
