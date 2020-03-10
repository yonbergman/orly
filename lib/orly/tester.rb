require 'git'

module Orly
  class NoRepo < StandardError ; end

  class Tester

    def initialize
      @need_bundle = false
      @need_migrate = false
      @need_bower = false
      @need_npm = false
      @uses_yarn = false
      @need_dotenv = false
      @need_mix = false
      @need_ecto_migrate = false
      @need_ecto_seed = false
      run_tests
    rescue ArgumentError
      raise NoRepo.new
    end

    def run_tests
      get_diff.each do |file|
        case(file.path)
          when /^Gemfile/ then @need_bundle = true
          when /^db\/migrate/ then @need_migrate = true
          when /^Podfile/ then @need_pod = true
          when /^bower\.json/ then @need_bower = true
          when /package\.json/ then @need_npm = true
          when /^yarn\.lock/ then @uses_yarn = true
          when /^.dotenv-encrypted/ then @need_dotenv = true
          when /^mix\.lock/ then @need_mix = true
          when /priv\/[-_.A-Za-z0-9]*\/migrations/ then @need_ecto_migrate = true
          when /priv\/[-_.A-Za-z0-9]*\/(?:seeds\.exs|fixtures\/[-_.A-Za-z0-9]*\.exs)/ then @need_ecto_seed = true
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

    def need_pod?
      @need_pod
    end

    def need_bower?
      @need_bower
    end

    def need_npm?
      return false if uses_yarn?
      @need_npm
    end

    def need_yarn?
      return false unless uses_yarn?
      @need_npm
    end

    def need_dotenv?
      @need_dotenv
    end

    def uses_yarn?
      @uses_yarn
    end

    def need_mix?
      @need_mix
    end

    def need_ecto_migrate?
      @need_ecto_migrate
    end

    def need_ecto_seed?
      @need_ecto_seed
    end
  end
end
