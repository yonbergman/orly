#!/usr/bin/env ruby

begin
  require 'lib/orly'
rescue LoadError
  require 'rubygems'
  require 'lib/orly'
end

include Orly

Choice.options do

  header "Orly notifies you whenever you pull an update that requires 'bundle install' or 'rake db:migrate'"

  option :install do
    short '-i'
    long "--install"
    desc "install orly for this git repo"
    action { Orly::Installation::install() }
  end

  option :uninstall do
    short '-u'
    long "--uninstall"
    desc "uninstall orly for this git repo"
    action { Orly::Installation::uninstall() }
  end

  option :run do
    short '-r'
    long "--run"
    desc "run orly now"
    action { Orly::run() }
  end

end

Choice.help if Choice.choices.empty?