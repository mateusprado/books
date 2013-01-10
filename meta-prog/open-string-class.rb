class String
  def to_alphanumerics
    gsub /[^\w\s]/,'' 
  end
end
