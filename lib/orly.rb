require 'lib/orly/installation'
require 'lib/orly/tester'
require "choice"
require "colored"

module Orly

  def self.run
    tester  = Orly::Tester.new()
    puts "ya rly: you need to run 'rake db:migrate'".red if tester.need_migrate?
    puts "ya rly: you need to run 'bundle install'".red if tester.need_bundle_install?
  rescue Orly::NoRepo
    puts "orly: this is not a git repo".red
  end


end