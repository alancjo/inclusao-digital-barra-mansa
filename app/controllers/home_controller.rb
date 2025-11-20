class HomeController < ApplicationController
  def index
    @mentors = Mentor.order(created_at: :desc)
    @supporters = Supporter.order(created_at: :desc)
    @students = Student.order(created_at: :desc)

    @stats = {
      mentors_count: Mentor.count,
      supporters_count: Supporter.count,
      students_count: Student.count,
      expertise_distribution: expertise_distribution,
      top_interests: top_interests(5)
    }
  end

  private

  def expertise_distribution
    Mentor.group(:expertise).count.sort_by { |_, v| -v }
  end

  def top_interests(limit = 5)
    freq = Hash.new(0)
    Student.find_each do |s|
      s.interests_tokens.each { |token| freq[token] += 1 }
    end
    freq.sort_by { |_, v| -v }.first(limit)
  end
end
