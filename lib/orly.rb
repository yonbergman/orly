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
    mix_commands = []

    notify << "run 'bundle install'".red if tester.need_bundle_install?
    notify << "run 'rake db:migrate'".red if tester.need_migrate?
    notify << "run 'dotenv-sync merge'".red if tester.need_dotenv?
    notify << "run 'pod install'".blue if tester.need_pod?
    notify << "run 'bower install'".green if tester.need_bower?
    notify << "run 'npm install'".green if tester.need_npm?
    notify << "run 'yarn install'".green if tester.need_yarn?
    
    mix_commands << 'deps.get' if tester.need_mix?
    mix_commands << 'ecto.migrate' if tester.need_ecto_migrate?
    mix_commands << 'ecto.seed' if tester.need_ecto_seed?

    if mix_commands.length == 1
      notify << "run 'mix #{mix_commands.join}'".magenta
    elsif mix_commands.length > 1
      notify << "run 'mix do #{mix_commands.join(',')}'".magenta
    end

    Orly::OwlPrinter.print(notify) unless notify.empty?
  rescue Orly::NoRepo
    puts "O RLY: this is not a git repo".red
  end

end
