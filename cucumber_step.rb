class CucumberStep

  attr_reader :keyword, :name, :line, :result

  def initialize(step)
    @step = step
    @keyword = step['keyword']
    @name = step['name']
    @line = step['line']
    @result = step['result']
  end
end