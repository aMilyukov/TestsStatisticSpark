require 'json'

class DataEngine

  attr_reader :json

  def initialize(data_folder)
    @json = Dir[data_folder + '/*.json'].map {|f| JSON.parse File.read(f)}.flatten
  end

  def get_fail_rate(test_name)
    @json.each do |i|

    end
  end

  def get_all_scenarios
    result = []
    @json.each do |i|
      elements = i['elements']
      elements.each do |p|
        if p['type'] == 'scenario'
          result.push(p)
        end
      end
    end
    result
  end

  def get_stat
    @json.each do |i|
      elements = i['elements']

      elements.each do |p|
        if p['type'] == 'scenario'
          puts p['name']
        end
      end




      puts i['uri'] + ' --------------- ' + i['elements'].length.to_s
    end
  end

  def get_scenarios_by_name(name)
    result = []
    @json.each do |i|
      elements = i['elements']
      elements.each do |p|
        if p['name'] == name
          result.push(p)
        end
      end
    end
    result
  end

  def get_elements_names(elements)
    result = []
    elements.each do |element|
      result.push(element['name'])
    end
    result
  end

  def get_all_unique_scenarios
    result = []
    @json.each do |feature|
      feature['elements'].each do |element|
        type_of_element = element['type']
        if type_of_element == 'scenario' && !get_elements_names(result).include?(element['name'])
          result.push(element)
        end
      end
    end
    return result
  end

  def scenario_result(scenario)
    steps_results = []
    scenario['steps'].each do |step|
      steps_results.push(step['result']['status'])
    end
    steps_results
    if steps_results.include?('failed')
      'failed'
    elsif steps_results.include?('skipped')
      'skipped'
    else
      'passed'
    end
  end

  def scenario_results(scenarios)
    results = []
    scenarios.each do |scenario|
      results.push(self.scenario_result(scenario))
    end
    results
  end


end

a = DataEngine.new('data')
#puts a.get_all_scenarios[0]['name']
#puts a.get_all_unique_scenarios.length
scenario =  a.get_scenarios_by_name("Verify \"Forgot your password?\" works, tc_id: 'GTWO-1855'")

puts a.scenario_results(scenario)



# b = a.get_all_unique_scenarios
# c =
# # c = lambda do |i|
# #   i.each do |o|
# #     puts o['name']
# #   end
# # end
# #
# # c.call(b)
# # a.get_stat
# # puts a.json.length
# puts b