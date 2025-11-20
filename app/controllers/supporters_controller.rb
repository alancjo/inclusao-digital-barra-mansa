class SupportersController < ApplicationController
  before_action :set_supporter, only: %i[show edit update destroy]

  def index
    @supporters = Supporter.order(created_at: :desc)
  end

  def show; end

  def new
    @supporter = Supporter.new
  end

  def edit; end

  def create
    @supporter = Supporter.new(supporter_params)
    if @supporter.save
      redirect_to @supporter, notice: "Apoiador criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @supporter.update(supporter_params)
      redirect_to @supporter, notice: "Apoiador atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @supporter.destroy
    redirect_to supporters_url, notice: "Apoiador removido."
  end

  private

  def set_supporter
    @supporter = Supporter.find(params[:id])
  end

  def supporter_params
    params.require(:supporter).permit(:name, :support_type, :contact_info)
  end
end
