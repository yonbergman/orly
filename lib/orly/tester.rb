require 'git'

module Orly
  class NoRepo < StandardError ; end

  class Tester

    def initialize
      @need_bundle = false
      @need_migrate = false
      run_tests
    rescue ArgumentError
      raise NoRepo.new
    end

    def run_tests
      get_diff.each do |file|
        if file.path =~ /^Gemfile/
          @need_bundle = true
        elsif file.path =~ /^db\/migrate/
          @need_migrate = true
        end
      end
    rescue Git::GitExecuteError
      false
    end

    def get_diff
      git = Git.open('.')
      git.diff('HEAD@{1}','HEAD')
    end

    def need_migrate?
      @need_migrate
    end

    def need_bundle_install?
      @need_bundle
    end
  end
end