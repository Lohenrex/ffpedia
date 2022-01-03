# Ffpedia

***THIS IS A WORK IN PROGRESS.***

This gem is a wrapper for the Final Fantasy API at [Moogle API](https://www.moogleapi.com). To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ffpedia'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ffpedia

## Usage

In order to make a request to the API, call a method within the **Ffpedia** module, e.g.,
```ruby
Ffpedia.characters
```

### Available methods
#### Characters
* characters: Retrieve a list of every character in the API's database. (Array)
* characters_count: Get the count of avaiable characters. (Integer)
* character(id): Find a character by its id. (Hash)
* random_character: Get a random character. (Hash)
* characters_by_game(game): Retrieve a list of characters filtered by the game where they are featured in. (Array)
* characters_by_name(character): Retrieve a list of characters filtered by their name. (Array)
* characters_by_race(race): Retrieve a list of characters filtered by their race. (Array)
* characters_by_job(job): Retrieve a list of characters filtered by their job. (Array)

#### Games
* games: Retrieve a list of every game in the API's database. (Array)
* game(id): Find a game by its id. (Hash)

#### Monsters
* monsters: Retrieve a list of every monsater in the API's database. (Array)
* monster(id): Find a monster by its id. (Hash)
* monsters_by_name(monster): Retrieve a list of monsters filtered by their name. (Array)

#### Misc
* jobs: Retrieve a list with every job available. (Array)
* races: Retrieve a list with every race available. (Array)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Lohenrex/ffpedia. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/ffpedia/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ffpedia project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Lohenrex/ffpedia/blob/main/CODE_OF_CONDUCT.md).
