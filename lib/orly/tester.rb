require 'git'

module Orly
  class NoRepo < StandardError ; end

  class Tester

    def initialize
      @diff = get_diff
    rescue ArgumentError
      raise NoRepo.new
    end

    def get_diff
      #git diff --name-only HEAD@{1} HEAD
      git = Git.open('.')
      git.diff('HEAD@{1}','HEAD')
    end

    def need_migrate?
      @diff.path('db/migrate').to_a.length > 0
    rescue Git::GitExecuteError
      false
    end

    def need_bundle_install?
      @diff.select {|file| file.path =~ /^Gemfile/}.length > 0
    rescue Git::GitExecuteError
      false
    end
  end
end