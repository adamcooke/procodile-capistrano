# Procodile Capistrano Recipes

[Procodile](https://adam.ac/procodile) is a process mangager for development & production use.

These are recipes for Capistrano 2 and 3 which will automatically send the appropriate commands whenever you start, stop or restart a deployment. Both sets of recipes allow you to run `procodile` commands directly as well as running them automatically on deployment.

* `procodile:start` - start processes
* `procodile:stop` - stops processes
* `procodile:restart` - restarts processes
* `procodile:status` - returns the status output

You can also pass a list of processes to the first three commands using the `processes` option. For example:

```
cap procodole:restart -s "processes=worker"
```

## Installation

Add the gem to your Gemfile and run `bundle install`.

```ruby
group :development do
  gem 'procodile-capistrano'
end
```

Then you'll need to require the appropriate file in your `Capfile`.

```ruby
# For Capistrano 2
require 'procodile/capistrano2'
# For Capistrano 3
require 'procodile/capistrano3'
```
