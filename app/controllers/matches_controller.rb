class MatchesController < ApplicationController
  def index
    @tab = params[:tab] || "sugestoes"

    case @tab
    when "sugestoes"
      # Calcula sugestões apenas para alunos que ainda não têm match aceito
      students_without_match = Student.left_joins(:matches)
                                      .where(matches: { status: [ "accepted", nil ] })
                                      .where.not(id: Match.accepted.select(:student_id))
                                      .order(:full_name)
      @mentors = Mentor.all
      @suggestions = students_without_match.map do |student|
        result = Matching::StudentMatcher.new(student, @mentors).best_match
        { student: student, mentor: result&.dig(:mentor), score: result&.dig(:score).to_i }
      end
    when "pendentes"
      @pending_matches = Match.pending.includes(:student, :mentor).order(score: :desc, created_at: :desc)
    when "ativas"
      @active_matches = Match.accepted.includes(:student, :mentor).order(created_at: :desc)
    end
  end

  def create
    @student = Student.find(params[:student_id])
    @mentor = Mentor.find(params[:mentor_id])
    @score = params[:score].to_i

    @match = Match.new(student: @student, mentor: @mentor, score: @score, status: "pending")

    if @match.save
      redirect_to match_path(tab: "pendentes"), notice: "Conexão enviada para aprovação!"
    else
      redirect_to match_path(tab: "sugestoes"), alert: @match.errors.full_messages.join(", ")
    end
  end

  def accept
    @match = Match.find(params[:id])
    if @match.update(status: "accepted")
      redirect_to match_path(tab: "ativas"), notice: "Conexão aceita com sucesso!"
    else
      redirect_to match_path(tab: "pendentes"), alert: "Erro ao aceitar conexão."
    end
  end

  def reject
    @match = Match.find(params[:id])
    if @match.update(status: "rejected")
      redirect_to match_path(tab: "pendentes"), notice: "Conexão rejeitada."
    else
      redirect_to match_path(tab: "pendentes"), alert: "Erro ao rejeitar conexão."
    end
  end
end
