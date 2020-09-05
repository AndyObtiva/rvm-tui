# Ruby enVironment Manager - Text-based User Interface
[![Gem Version](https://badge.fury.io/rb/rvm-tui.svg)](https://badge.fury.io/rb/rvm-tui)

[RVM](https://rvm.io) is the original Ruby enVironment Manager that is used to:
- Effortlessly install multiple versions of [Ruby](https://www.ruby-lang.org/en/), including [JRuby](https://www.jruby.org/)
- Isolate projects from each other with gemsets to:
  - Enable higher productivity by being able to work on projects completely worry-free without any concerns about side-effects on other projects
  - Ability to manage a project's gems (including mass deletion) without worrying about affecting other projects
  - Prevent odd bugs that happen when sharing gems with other projects due to making changes in them
  - Simplify gem-related troubleshooting without a domino effect on other projects
  
Given how practical and often-used [RVM](https://rvm.io) is, I am providing a text-based user interface for it.

![RVM TUI DEMO](rvm-tui-demo.gif)

## Pre-requisites

- [RVM](https://rvm.io)
- Any version of Ruby installed via [RVM](https://rvm.io)

## Setup Instructions

The gem can be installed unto any [Ruby](https://rvm.io/rubies/installing)/[Gemset](https://rvm.io/gemsets/basics) in [RVM](https://rvm.io) and it will be used from there everywhere. 

Since it is independent of any particular [Ruby](https://www.ruby-lang.org/en/) project, it is recommended you install unto the default [gemset](https://rvm.io/gemsets/basics).

Afterwards, run the `rvm-tui-setup` command from the same [RVM](https://rvm.io) [Ruby](https://rvm.io/rubies/installing)/[Gemset](https://rvm.io/gemsets/basics) you installed the gem at to setup the `rvm-tui` function source in `~/.bash_profile` or `~/.bashrc` (whichever is available)

These are the commands you need to run:

```
rvm use @default
gem install rvm-tui
rvm-tui-setup
```

## Usage

Simply run this command:

```
rvm-tui
```

## Contributing to rvm-tui

-   Make sure you have [RVM](https://rvm.io) installed
-   Check out the latest master to make sure the feature hasn't been
    implemented or the bug hasn't been fixed yet.
-   Check out the issue tracker to make sure someone already hasn't
    requested it and/or contributed it.
-   Fork the project.
-   Start a feature/bugfix branch.
-   `bundle`
-   Commit and push until you are happy with your contribution.
-   `rake install` to test (or `rake build`, `rvm use @default`, and then `gem install pkg/rvm-tui-{version}.gem`)
-   Please try not to mess with the Rakefile, version, or change log. If
    you want to have your own version, or is otherwise necessary, that
    is fine, but please isolate to its own commit so I can cherry-pick
    around it.

## TODO

[TODO.md](TODO.md)

## Change Log

[CHANGELOG.md](CHANGELOG.md)

## License

[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)

Copyright (c) 2020 Andy Maleh. See [LICENSE.txt](LICENSE.txt) for further details.
