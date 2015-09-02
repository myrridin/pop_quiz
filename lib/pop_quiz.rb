class PopQuiz
  def self.test_file(filename)
    begin
      file_data = File.read filename
      require_relative "../#{filename}"
    rescue Errno::ENOENT => e
      puts 'Error reading file'
      return false
    end
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