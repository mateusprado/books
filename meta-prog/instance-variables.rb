class Boleto
  def set(var, value)
    var_name = "@#{var}"
    instance_variable_set(var_name, value)
  end

  def get(var) 
    instance_variable_get("@#{var}") 
  end
end
