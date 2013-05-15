module Leaf
    class Cleaner
        def self.clean leaf_pile
            leaf_pile = leaf_pile.split("\n")
            results = {}
            results[:dont_exist] = Array.new
            results[:original] = leaf_pile
            repos = []
            if leaf_pile.class.to_s == "Array" && leaf_pile.length > 0
                leaf_pile.each do |leaf|
                    if !File.directory? leaf
                        results[:dont_exist] << leaf
                    end
                end
            else
                puts "No leaf pile!"
                exit 1
            end
            leaf_pile = leaf_pile - results[:dont_exist]
            if leaf_pile.length > 0
                leaf_pile.each do |leaf|
                    repo = git_repo? leaf
                    if repo
                        repos << repo
                    end
                end
            end
            results[:leaf_pile] = repos.uniq
            results
        end

        private

        # When given a directory, attempt to determine if it is a git repo
        def self.git_repo? dir
            # Don't recurse too deeply
            if dir == '/'
                return false
            end
            Dir.chdir dir
            # If we are in a git directory, we can return the directory
            if File.directory? '.git'
                return dir
            else
                # If this wasn't a git repo, travel up to try and find one
                return git_repo? File.expand_path('../', dir)
            end
        end
    end
end
