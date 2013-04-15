# Peek::ActiveRecord

Peek into your ActiveRecord stats.

## Installation

Add this line to your application's Gemfile:

    gem 'peek-active_record'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install peek-active_record

## Usage

``` ruby
# config/initializers/peek.rb
Peek.into Peek::Views::ActiveRecord
```

``` coffee
# app/assets/application.coffee
#= require 'peek/views/active_record'
```

Then, in any ActiveRecord model you wish to watch allocations of
(please note that after_initialize does impair performance of your app slightly)
simply include the `Peek::ActiveRecord::ObjectStats` module.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
