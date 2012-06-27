require 'orly/installation'
require 'orly/tester'
require 'orly/version'
require "choice"
require "colored"

module Orly

  def self.run
    tester  = Orly::Tester.new()
    puts "O RLY: you need to run 'rake db:migrate'".red if tester.need_migrate?
    puts "O RLY: you need to run 'bundle install'".red if tester.need_bundle_install?
  rescue Orly::NoRepo
    puts "O RLY: this is not a git repo".red
  end


end