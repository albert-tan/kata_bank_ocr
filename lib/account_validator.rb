class AccountValidator

  def validate_account_number(account_number)
    checksum = 0
    multiplier = account_number.length
    account_number.each do |digit|
      checksum += (digit.to_i * multiplier)
      multiplier -= 1
    end
    checksum % 11 == 0
  end

end

