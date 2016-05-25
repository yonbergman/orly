![ORLY](images/orly.png)
# ORLY

A tool that lets you know when you need to run development commands

## Installation

Simply install the gem once,

    [sudo] gem install orly

and install O RLY in each Git Repo

    orly --install

To remove O RLY just run `orly --uninstall` inside the git repo.

## Supported Commands

ORLY supports the following development commands and knows to alert you when you need to run them

#### Ruby / Rails
* `bundle install` - for Gemfile.lock changes
* `rake db:migrate` - for db/migration changes

#### iOS
* `pod install` - for Podfile.lock changes

#### NPM / Bower
* `npm install` - for package.json changes
* `bower install` - for bower.json changes

## More info

In the Github page https://github.com/yonbergman/orly/

---
Copyright (c) 2015 Yonatan Bergman, released under the MIT license
