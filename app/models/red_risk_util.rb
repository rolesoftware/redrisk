class RedRiskUtil

  def self.convert_money_to_float(money)
    return 0.0 if money.nil?
    money.gsub(/[$ ]/,'').gsub(/[.]/, '').gsub(/[,]/, '.').to_f
  end

end