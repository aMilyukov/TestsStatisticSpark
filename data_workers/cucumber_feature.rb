require_relative 'cucumber_element'

class CucumberFeature

  attr_reader :uri, :id, :keyword, :name, :description, :line, :elements

  def initialize(feature)
    @feature = feature
    @uri = feature['uri']
    @id = feature['id']
    @keyword = feature['keyword']
    @name = feature['name']
    @description = feature['description']
    @line = feature['line']
    @elements = init_elements
  end

  def init_elements
    elements = []
    @feature['elements'].each do |element|
      elements.push(CucumberElement.new(element))
    end
    elements
  end
end