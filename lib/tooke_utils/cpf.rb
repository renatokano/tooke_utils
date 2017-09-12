require "tooke_utils/version"
require "tooke_utils/general"

module TookeUtils
  class CPF
    def self.is_cpf? str
      TookeUtils::General.only_numbers(str).size == 11
    end

    def self.generate
      cpf = (rand(0)*(10**9)).round.to_s
      while cpf.size != 9
        cpf += "0"
      end
      digits = (calculate_digits cpf)
      cpf += digits[0].to_s + digits[1].to_s
      cpf = mask cpf
      return cpf
    end

    def self.mask str
      if TookeUtils::General.only_numbers(str).size == 11 
        blc = /([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})/.match(str)
        blc[1] + "." + blc[2] + "." + blc[3] + "-" + blc[4]
      else
        nil
      end
    end

    def self.calculate_digits str
      sum1,sum2 = 0,0
      
      for i in 0..8 do
        sum1 += str[i].to_i * (10-i)
        sum2 += str[i].to_i * (11-i)
      end        

      # Digit 1
      digit_1 = (sum1 * 10) % 11
      digit_1 == 10 ? digit_1 = 0 : digit_1

      # Digit 2
      sum2 += digit_1 * 2
      digit_2 = (sum2 * 10) % 11
      digit_2 == 10 ? digit_2 = 0 : digit_2
      
      digits = [digit_1, digit_2]
    end

    def self.is_valid? str
      if is_cpf? str
        str = TookeUtils::General.only_numbers str
        digits = calculate_digits str
        # Verification
        digits[0] == str[-2].to_i && digits[1] == str[-1].to_i
      end
    end
  end
end