class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[edit show update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def  index
    @tests = Test.all
  end

  def new
    @test = current_user.authored_tests.build
  end

  def edit; end

  def show; end

  def create
    @test = current_user.authored_tests.build(test_params)
    if @test.save
      redirect_to [:admin, @test]
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to [:admin, @test]
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Тест не найден'
  end
end
