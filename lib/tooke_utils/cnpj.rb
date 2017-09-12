require "tooke_utils/version"
require "tooke_utils/general"

module TookeUtils
  class CNPJ
    def self.is_cnpj? str
      TookeUtils::General.only_numbers(str).size == 14
    end

    def self.generate
      cnpj = (rand(0)*(10**12)).round.to_s
      while cnpj.size != 12
        cnpj += "0"
      end
      digits = (calculate_digits cnpj)
      cnpj += digits[0].to_s + digits[1].to_s
      cnpj = mask cnpj
      return cnpj
    end

    def self.mask str
      if is_cnpj? str 
        blc = /([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})/.match(str)
        blc[1] + "." + blc[2] + "." + blc[3] + "/" + blc[4] + "-" + blc[5]
      else
        nil
      end
    end

    def self.calculate_digits str
      sum1,sum2 = 0,0
      multipliers = [6,5,4,3,2,9,8,7,6,5,4,3,2]

      for i in 0..11 do 
        sum1 += multipliers[i+1] * str[i].to_i
        sum2 += multipliers[i] * str[i].to_i
      end

      # Digit 1
      digit_1 = sum1.remainder 11
      digit_1 < 2 ? digit_1 = 0 : digit_1 = 11 - digit_1

      # Digit 2
      sum2 += multipliers[12] * digit_1
      digit_2 = sum2.remainder 11
      digit_2 < 2 ? digit_2 = 0 : digit_2 = 11 - digit_2

      digits = [digit_1, digit_2]
    end

    def self.is_valid? str
      if is_cnpj? str
        str = TookeUtils::General.only_numbers str
        digits = calculate_digits str
        # Verification
        digits[0] == str[-2].to_i && digits[1] == str[-1].to_i
      end
    end
  end
end