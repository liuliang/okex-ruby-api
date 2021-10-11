# OKEX::API

This gem is a ruby SDK for the OKEX crypto exchange REST API.

API docs can be found on the [OKEX developer site](https://www.okex.com/docs/)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'okex-ruby-api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install okex-ruby-api

## Usage

### Futures

Initialize a futures session:
```ruby
futures = OKEX::API::Futures.new
```

Query for all current futures specs:
```ruby
futures.list
```

Query for all current futures prices:
```ruby
futures.tickers
```

Fetch a single current futures price:
```ruby
futures.ticker('BTC-USDT-220325')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.

You'll then need to add environment variables `ENV['OKEX_KEY']` and `ENV['OKEX_SECRET']`. API keys can be created in your [OKEX settings page](https://www.okex.com/account/users/myApi).

Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/benrs44/okex-ruby-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/benrs44/okex-ruby-api/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ftx::Api project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/benrs44/okex-ruby-api/blob/master/CODE_OF_CONDUCT.md).