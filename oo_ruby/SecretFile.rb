class SecretFile

  def initialize(secret_data)
    @data = secret_data
  end
  
  def read_data
    SecurityLogger
    @data
end

class SecurityLogger
  def create_log_entry
  end
end