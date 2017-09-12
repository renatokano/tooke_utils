# Tooke Utils

Welcome to TookeUtils!

In this version, this toolkit allows the generation and validation of CPF's and CNPJ's. For now, the use is exclusive to Brazil.

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

- CPF:

Generate a valid CPF:

    $ cpf = TookeUtils::CPF.generate
    
Check if 'cpf' is valid:    
    
    $ TookeUtils::CPF.is_valid? cpf

Apply a valid mask to cpf:
    $ cpf = "12345678900"
    $ TookeUtils::CPF.mask cpf

- CNPJ:

Generate a valid CNPJ:

    $ cnpj = TookeUtils::CNPJ.generate

Check if 'cnpj' is valid:

    $ TookeUtils::CNPJ.is_valid? cnpj

Apply a valid mask to cnpj:

    $ cnpj = "41737186000143"
    $ TookeUtils::CNPJ.mask cnpj  

## Future Implementations

- ZipCode validation (Brazil)
- Get 'Address', 'City' and 'State' using ZipCode (WebService)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/renatokano/tooke_utils.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
