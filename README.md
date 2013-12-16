# <a name="title"></a> Nameit! "Give it a name, why dont'cha?"

[![Gem Version](https://badge.fury.io/rb/nameit.png)](http://badge.fury.io/rb/nameit)
[![Build Status](https://secure.travis-ci.org/fnichol/nameit.png)](http://travis-ci.org/fnichol/nameit)
[![Code Climate](https://codeclimate.com/github/fnichol/nameit.png)](https://codeclimate.com/github/fnichol/nameit)
[![Dependency Status](https://gemnasium.com/fnichol/nameit.png)](https://gemnasium.com/fnichol/nameit)

Nameit is a small zero-dependency library and tool that helps you generate a random name for a project, database, session--you decide. You get glorious **adjective-noun** style names such as **"pushy-clock"** and **"lovely-ducks"** or ask for a random number on the end to give you names like **"numberless-cactus-123"** and **"superb-shoes-915"**.

* No dependencies
* Runs on all the Ruby implementations
* Uses `SecureRandom`

## <a name="installation"></a> Installation

Add this line to your application's Gemfile:

```ruby
gem 'namit'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install namit
```

## <a name="usage"></a> Usage

### <a name="usage-bin"></a> nameit Command

Nameit ships with the `nameit` command so you can get a shiny new name right from the command line:

```sh
$ nameit
abhorrent-flowers
$ nameit 3
cowardly-pot
quickest-sleep
heartbreaking-lamp
```

### <a name="usage-ruby"></a> Ruby Library

Use it with a class method for a quick one-offs:

```ruby
require 'nameit'

Nameit.generate
# => "sassy-clocks"
Nameit.generate
# => "dazzling-comb"

Nameit.generate(number: true)
# => "blushing-camera-632"
```

Or for peppier performance (to save on re-reading the data sources), use a `Nameit` instance:

```ruby
require 'nameit'

nameit = Nameit.new

3.times.map { nameit.generate }
# => ["ethereal-music", "historical-argument", "recondite-pear"]

nameit = Nameit.new(number: true)

2.times.map { nameit.generate }
# => ["peaceful-book-260", "synonymous-lizards-501"]
```

## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## <a name="authors"></a> Authors

Created and maintained by [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>)

## <a name="license"></a> License

MIT (see [LICENSE][license])

[license]:      https://github.com/fnichol/nameit/blob/master/LICENSE.txt
[fnichol]:      https://github.com/fnichol
[repo]:         https://github.com/fnichol/nameit
[issues]:       https://github.com/fnichol/nameit/issues
[contributors]: https://github.com/fnichol/nameit/contributors
