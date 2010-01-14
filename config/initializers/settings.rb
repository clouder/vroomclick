class Settings
  def self.[]=(var_name, value)
    var_name = var_name.to_s
    value = @@defaults[var_name] if value.blank?
    
    record = object(var_name) || Settings.new(:var => var_name)
    record.value = value
    record.save
  end
end

Settings.defaults[:dealership_name] = 'Vroomclick'