# Vatlayer

[![Build Status](https://travis-ci.org/drEnilight/vatlayer-ruby.svg?branch=master)](https://travis-ci.org/drEnilight/vatlayer-ruby) [![codecov.io](https://codecov.io/github/drEnilight/vatlayer-ruby/coverage.svg?branch=master)](https://codecov.io/gh/drEnilight/vatlayer-ruby?branch=master)

The Ruby gem for accessing the Vatlayer API painlessly, easily, and awesomely! This gem is actively being developed. **Be sure to check the branch for the version you're using.**

**Important and helpful links:**

- [Vatlayer API documentation](https://vatlayer.com/documentation)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vatlayer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vatlayer

## Usage

```ruby
require 'vatlayer'
vatlayer = Vatlayer.new('Your API access key')

```
You can find your API key in your Vatlayer account, by [reference](https://vatlayer.com/dashboard). API access is available for every Vatlayer account.

## Configuration

API keys *must* be configured in the gem setup. You can do this anywhere in your application before you make API calls using the gem. You can find your API key in your Vatlayer account, by [reference](https://vatlayer.com/dashboard). API access is available for every Vatlayer account.

```ruby
Vatlayer.configure do |config|
  config.access_key = 'a1sad2f4g2srf'
  config.https = true
end
```

* `config.access_key` - your Vatlayer access key
* `config.https` - you can use https mode, default `false`

Please note that the https configuration is optional and only available to paid-accounts. If unset, these configuration-values are just nil.

## Available methods

Creating an instance of the Vatlayer client:
```ruby
vatlayer = Vatlayer.new('Your API access key')
```
If you've configured the gem with a default `access_key`, then you can just instantiate the class.
```ruby
vatlayer = Vatlayer.new
```

#### Validate
```ruby
vatlayer.validate(vat_number: 'LU26375245')

# <Vatlayer::Response::Data:0x0000555fd334ba10
#            @valid=true,
#            @database="ok",
#            @format_valid=true,
#            @query="LU26375245",
#            @country_code="LU",
#            @vat_number="26375245",
#            @company_name="AMAZON EUROPE CORE S.A R.L.",
#            @company_address="5, RUE PLAETIS L-2338  LUXEMBOURG">
```

#### Rate
TODO

#### Rate list
```ruby
vatlayer.rate_list

# <Vatlayer::Response::Data:0x0000564e0063b308
#   @rates=#<Vatlayer::Response::Data:0x0000564e00639d78
#   @at=#<Vatlayer::Response::Data:0x0000564e00638b30
#     @country_name="Austria",
#     @reduced_rates=#<Vatlayer::Response::Data:0x0000564e0062e270
#                     @admission_to_cultural_events=10,
#                     @admission_to_entertainment_events=10,
#                     @books=10,
#                     @foodstuffs=10,
#                     @hotels=10,
#                     @newspapers=10,
#                     @passenger_transport=10,
#                     @pharmaceuticals=10>,
#     @standard_rate=20>,

```

#### Price
TODO

### Fetch errors

```ruby
vatlayer = Vatlayer.new('invalid_access_key')
vatlayer.validate('LU26375245')

# <Vatlayer::Response::Data:0x0000555fd3379c80
#            @success=false,
#            @error=#<Vatlayer::Response::Error:0x0000555fd33797d0
#                               @code=101,
#                               @type="invalid_access_key",
#                               @info="You have not supplied a valid API Access Key. [Technical Support: support@apilayer.com]">
```


## License
The Teamleader GEM is released under the MIT License.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
