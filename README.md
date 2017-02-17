# Wechselkurse
Wechselkurse is a Ruby wrapper and CLI for some APIs of currency exchange rates.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wechselkurse'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wechselkurse

## Usage

Create/update your docker images:

```sh
$ docker build -t wechselkurse .
```

Run your containers:

```sh
$ docker run -d wechselkurse
```

Access application container:
```sh
$ docker run -it wechselkurse bash
```

Running tests cases:
```sh
$ docker run -it wechselkurse bundle exec rspec
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/icaroseara/wechselkurse.
