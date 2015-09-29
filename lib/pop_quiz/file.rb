module PopQuiz
  class File
    def self.require(filename)
      begin
        require_relative "#{Dir.pwd}/#{filename}"
        ::File.read filename
      rescue Errno::ENOENT => e
        raise PopQuiz::FileException.new "Could not read file #{filename}. Error: #{e}"
      rescue Exception => e
        raise PopQuiz::RequireException.new "Could not require file #{filename}. Error: #{e}"
      end
    end
  end
end