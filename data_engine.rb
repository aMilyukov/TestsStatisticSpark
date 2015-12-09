require 'json'

class DataEngine

  def initialize(data_folder)
    @json = Dir[data_folder + '/*.json'].map {|f| JSON.parse File.read(f)}.flatten
  end

  def show_json
    puts @json
  end
end

DataEngine.new('data').show_json