module Matching
  class StudentMatcher
    STOPWORDS = %w[de da do e a o as os para em com].freeze

    def initialize(student, mentors)
      @student = student
      @mentors = mentors
    end

    def best_match
      scored = @mentors.map { |m| [ m, score_for(m) ] }.sort_by { |_, s| -s }
      top = scored.first
      return nil if top.nil? || top.last <= 0
      { mentor: top.first, score: top.last }
    end

    private

    def score_for(mentor)
      score = 0
      tokens = @student.interests_tokens
      if tokens.any? { |t| mentor.expertise.to_s.downcase.include?(t) }
        score += 5
      end
      if @student.availability.present? && mentor.availability.to_s.downcase.include?(@student.availability.to_s.downcase)
        score += 3
      end
      if @student.learning_goal.present? && mentor.bio.present?
        student_words = filter_words(@student.learning_goal)
        mentor_words = filter_words(mentor.bio)
        overlap = student_words & mentor_words
        score += [ overlap.size, 3 ].min
      end
      score
    end

    def filter_words(text)
      text.to_s.downcase.scan(/[a-záàâãéêíóôõúç]+/).reject { |w| STOPWORDS.include?(w) }
    end
  end
end
