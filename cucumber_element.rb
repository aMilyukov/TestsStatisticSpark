require 'pry'
require_relative 'cucumber_before'
require_relative 'cucumber_step'

class CucumberElement

  attr_reader :keyword, :name, :description, :line, :type, :before, :steps

  def initialize(element)
    @element = element
    @keyword = element['keyword']
    @name = element['name']
    @description = element['description']
    @line = element['line']
    @type = element['type']
    @before =  init_befores if @element['before']
    @steps = init_steps if @element['steps']
  end

  def init_befores
    results = []
    @element['before'].each do |before|
      results.push(CucumberBefore.new(before))
    end
  end

  def init_steps
    results = []
    @element['steps'].each do |step|
      results.push(CucumberStep.new(step))
    end
  end

end