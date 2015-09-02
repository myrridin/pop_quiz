class Thing

  # This is a comment. It should be ignored.
  def hello
    puts "Hello!"
  end

  # Below is a PopQuiz test. It should pass.
  # PQ: Thing.new.truthy_method == true
  def truthy_method
    true
  end

  # Below is another PopQuiz test. It should fail.
  # PQ: Thing.new.falsey_method == true
  def falsey_method
    false
  end

  # A third PopQuiz test. This one should raise an error.
  # PQ: Thing.new.error_method
  def error_method
    raise 'Error from Thing'
  end

end

