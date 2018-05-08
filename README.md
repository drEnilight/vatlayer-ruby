# Vatlayer

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
teamleader = Teamleader.new('Your API group', 'Your API secret')

```
You can find your API key in your Teamleader account, under Settings > API & Webhooks. API access is available for every Teamleader account.
Note that you need to be admin to access this page.

## Configuration

API keys *must* be configured in the gem setup. You can do this anywhere in your application before you make API calls using the gem.

```ruby
Vatlayer.configure do |config|
  config.access_key = 'a1sad2f4g2srf'
  config.https = true
end
```

* `config.access_key` - your Vatlayer access key
* `config.https` - your can use https mode, default `false`

Please note that the https configuration is optional and only available to paid-accounts. If unset, these configuration-values are just nil.

## Available methods
When a method expects a hash as argument, the hash keys have the same name as described in [Teamleader API documentation](http://apidocs.teamleader.be/).


## License
The Teamleader GEM is released under the MIT License.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
