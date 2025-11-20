class MatchesController < ApplicationController
  def index
    @students = Student.order(:full_name)
    @mentors = Mentor.all
    @matches = @students.map do |student|
      result = Matching::StudentMatcher.new(student, @mentors).best_match
      { student: student, mentor: result&.dig(:mentor), score: result&.dig(:score).to_i }
    end
  end
end
