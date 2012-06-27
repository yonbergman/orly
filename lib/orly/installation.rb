module Orly
  module Installation

    HOOK_PATH = File.join ".git", "hooks", "post-merge"
    HOOK_DIR  = File.join ".git", "hooks"
    HOOK_CONTENT = <<END
#!/bin/sh
orly --run
END

    def self.install
        if not File.directory?(".git")
          puts "You don't appear to be in the base directory of a git project.".red
          exit 1
        end

        Dir.mkdir(HOOK_DIR) unless File.directory?(HOOK_DIR)

        if File.exists? HOOK_PATH
          puts "A post-merge hook already exists for this project.".red
          exit 1
        end

        File.open(HOOK_PATH, 'w') {|f| f.write(HOOK_CONTENT) }
        FileUtils.chmod 0755, HOOK_PATH
        puts "installed O RLY hook as:".green
        puts "  -> #{File.expand_path(HOOK_PATH)}".green
        puts "(to remove later, you can use: orly --uninstall)"
    end

    def self.uninstall
      if File.exists? HOOK_PATH
        FileUtils.rm HOOK_PATH
        puts "uninstalled #{HOOK_PATH}".green
      else
        puts "O RLY is not enabled for this directory, so there is nothing to uninstall.".yellow
      end
    end


  end
end