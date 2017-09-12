require "tooke_utils/version"
require "tooke_utils/cpf"
require "tooke_utils/cnpj"

module TookeUtils
  class General
    def self.to_block_of_strings str
      if CPF.is_cpf? str
        /([0-9]{3})\.([0-9]{3})\.([0-9]{3})\-([0-9]{2})/.match str
      elsif CNPJ.is_cnpj? str
        /([0-9]{2})\.([0-9]{3})\.([0-9]{3})\/([0-9]{4})\-([0-9]{2})/.match str
      else
        nil
      end
    end
  
    def self.only_numbers str
      str.gsub(/[^0-9]/, '')
    end
  end
end