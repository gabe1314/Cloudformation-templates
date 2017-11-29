require_relative 'profile'

class ProfileLoader

  def initialize(rules_registry)
    @rules_registry = rules_registry
  end

  def load(profile_definition:)

    if profile_definition.nil? or profile_definition.strip == ''
      raise 'Empty profile'
    end

    new_profile = Profile.new

    profile_definition.each_line do |line|
      rule_id = line.chomp
      if @rules_registry.by_id(rule_id) == []
        raise "#{rule_id} is not a legal rule identifier from: #{@rules_registry.rules}"
      else
        new_profile.add_rule rule_id
      end
    end
    new_profile
  end
end