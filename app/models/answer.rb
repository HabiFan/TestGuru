class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers
    errors.add(:base, I18n.t('errors.question_max_answers')) if question.answers.count >= 4
  end

end
