class MentorsController < ApplicationController
  before_action :set_mentor, only: %i[show edit update destroy]

  def index
    @mentors = Mentor.order(created_at: :desc)
  end

  def show; end

  def new
    @mentor = Mentor.new
  end

  def edit; end

  def create
    @mentor = Mentor.new(mentor_params)
    if @mentor.save
      redirect_to @mentor, notice: 'Mentor criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @mentor.update(mentor_params)
      redirect_to @mentor, notice: 'Mentor atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mentor.destroy
    redirect_to mentors_url, notice: 'Mentor removido.'
  end

  private

  def set_mentor
    @mentor = Mentor.find(params[:id])
  end

  def mentor_params
    params.require(:mentor).permit(:full_name, :expertise, :bio, :availability, :contact_info)
  end
end
