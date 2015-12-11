require 'pry'
require_relative 'cucumber_json_report'

class DataEngine

  attr_reader :json_reports

  def initialize(folder)
    @json_reports = Dir[folder]
  end

  def get_data
    reports = []
    @json_reports.each do |report|
      reports.push(CucumberJsonReport.new(report))
    end
    reports
  end

end

a = DataEngine.new('data/*.json')
binding.pry