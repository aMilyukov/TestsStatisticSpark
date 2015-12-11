class CucumberResult

  attr_reader :status, :duration

  def initialize(result)
    @result = result
    @status = result['status']
    @duration = result['duration']
  end
end