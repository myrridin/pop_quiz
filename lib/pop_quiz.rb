require_relative 'pop_quiz/exception'
require_relative 'pop_quiz/file'

module PopQuiz
  def self.test_file(filename)
    file_data = PopQuiz::File.require(filename)
    comments = parse_comments(file_data)
    quizzes = parse_quizzes(comments)
    results = {}
    quizzes.each do |quiz|
      begin
        return_value = eval(quiz)
        if return_value
          results[quiz] = {success: true}
        else
          results[quiz] = {success: false, message: 'Quiz returned a falsey value'}
        end
      rescue Exception => e
        results[quiz] = {success: false, error: true, message: "Error was thrown: #{e}"}
      end
    end
    results
  end

  def self.parse_comments(file_data)
    file_data.split("\n").select { |line| line =~ /\s*#/ }.map { |line| line.sub /\s*# /, '' }
  end

  def self.parse_quizzes(comments)
    comments.select { |c| c[0..2] == 'PQ:' }.map { |c| c.sub 'PQ: ', '' }
  end
end