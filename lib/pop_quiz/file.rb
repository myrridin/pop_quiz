module PopQuiz
  class File
    def self.read_and_require(filename)
      file_data = read(filename)
      require_file(filename)
      file_data
    end

    private

    def self.require_file(filename)
      begin
        require_relative "#{Dir.pwd}/#{filename}"
      rescue Exception => e
        raise PopQuiz::RequireException.new "Could not require file #{filename}. Error: #{e}"
      end
    end

    def self.read(filename)
      begin
        ::File.read filename
      rescue Errno::ENOENT => e
        raise PopQuiz::FileException.new "Could not read file #{filename}. Error: #{e}"
      end
    end
  end
end