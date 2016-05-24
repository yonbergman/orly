require 'orly/installation'
require 'orly/tester'
require 'orly/owl_printer'
require 'orly/version'
require "choice"
require "colored"

module Orly

  def self.run
    tester  = Orly::Tester.new()
    notify = []
    notify << "run 'bundle install'".red if tester.need_bundle_install?
    notify << "run 'rake db:migrate'".red if tester.need_migrate?
    notify << "run 'pod install'".blue if tester.need_pod?
    notify << "run 'bower install'".green if tester.need_bower?
    notify << "run 'npm install'".green if tester.need_npm?
    Orly::OwlPrinter.print(notify) unless notify.empty?
  rescue Orly::NoRepo
    puts "O RLY: this is not a git repo".red
  end

end
