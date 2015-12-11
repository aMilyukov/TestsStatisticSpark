require 'json'
require_relative 'cucumber_feature'

class DataEngine

  attr_reader :json, :features

  def initialize(json_file)
    @json = JSON.parse(File.read json_file)
    @features = init_features
  end

  def init_features
    features = []
    @json.each do |feature|
      features.push(CucumberFeature.new(feature))
    end
    features
  end

end

a = DataEngine.new('cucumber.json')
# binding.pry
#a.features[0].elements.each { |i| puts i.type }
