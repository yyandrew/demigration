# Demigration

Auto generate migration file according from schema.rb

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'demigration'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install demigration

## Usage

Run this command in your terminal:
``` sh
demigration export! --table countries
```

It will generate migration file like:

``` ruby
# 20210623061828_create_countries.rb
class CreateCountries < ActiveRecord::Migration[6.1]
  create_table "countries", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255
    t.string "name", limit: 255
    t.string "fifa_code", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/qqerqqer@126.com/demigration. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/qqerqqer@126.com/demigration/blob/master/CODE_OF_CONDUCT.md).


## Code of Conduct

Everyone interacting in the Demigration project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/qqerqqer@126.com/demigration/blob/master/CODE_OF_CONDUCT.md).
