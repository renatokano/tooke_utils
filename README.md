# TookeUtils    
[![Build Status](https://travis-ci.org/renatokano/tooke_utils.svg?branch=master)](https://travis-ci.org/renatokano/tooke_utils)   [![Gem Version](https://badge.fury.io/rb/tooke_utils.svg)](https://badge.fury.io/rb/tooke_utils)   ![Gem](https://img.shields.io/gem/dt/tooke_utils)   

Welcome to TookeUtils!

In this version, this toolkit allows the generation, validation and formating of CPF's and CNPJ's. For now, the use is exclusive to Brazil.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tooke_utils'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tooke_utils

## Usage

Generate a valid CPF:

    $ cpf = TookeUtils::CPF.generate        # Generates a valid CPF like "267.573.018-14"
    
Check if 'cpf' is valid:    
    
    $ cpf = "267.573.018-14"                

    $ TookeUtils::CPF.is_valid? cpf         # True

Apply a valid mask to cpf:

    $ cpf = "26757301814"                   

    $ TookeUtils::CPF.mask cpf              # Results in "267.573.018-14"

Generate a valid CNPJ:

    $ cnpj = TookeUtils::CNPJ.generate      # Generates a valid CNPJ like "41.737.186/0001-43"

Check if 'cnpj' is valid:

    $ cnpj = "41737186000143"               

    $ TookeUtils::CNPJ.is_valid? cnpj       # True

Apply a valid mask to cnpj:

    $ cnpj = "41737186000143"               

    $ TookeUtils::CNPJ.mask cnpj            # Results in "41.737.186/0001-43"

## Future Implementations

- ZipCode validation (Brazil)
- Get 'Address', 'City' and 'State' using ZipCode (WebService)
- GoogleMaps Integration (API)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/renatokano/tooke_utils.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
