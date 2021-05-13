class QuestionsController < ApplicationController

  before_action :set_test
  before_action :set_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: "<h1>Тест: <%= @test.title %></h1>
                    <h3>Список вопросов</h3> 
                    <ol><% @test.questions.find_each do |question| %>
                    <li><%= question.body %></li><% end %></ol>"  

  end

  def new
    
  end

  def create
    question = @test.questions.create(question_params)
    if question.save
      render plain: "Вопрос создан успешно!"
    else
      render plain: "Что-то пошло не так!"
    end
  end

  def show
    render inline: '<%= @question.body %>>'
  end

  def destroy
    if @question.destroy
      render plain: "Вопрос удален успешно!"
    else
      render plain: "Что-то пошло не так!"
    end
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end

end
