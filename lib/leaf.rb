require 'leaf/argparser'
require 'leaf/cleaner'

module Leaf
    class Main
        def initialize args
            @options = Leaf::ArgParser.parse args
        end

        def run
            @cleaner_results = get_leaf_pile
            @leaf_pile = @cleaner_results[:leaf_pile]

            @report = get_report
            if @report.empty?
                puts "Everything looks good to leaf!"
                exit 0
            else
                puts "Leaf thinks you should look at some things:\n\n"
                puts @report
                exit 1
            end
        end

        private

        def get_report
            full_report = ""
            @leaf_pile.each do |leaf|
                report = ""
                Dir.chdir leaf
                status = `git status`
                if status.include? 'ahead'
                    report += "\t-> Unpushed changes!\n"
                end
                if status.include? 'to be committed'
                    report += "\t-> Uncommitted changes!\n"
                end
                if status.include? 'not staged'
                    report += "\t-> Unstaged changes!\n"
                end
                if status.include? 'untracked'
                    report += "\t-> Untracked files!\n"
                end
                remote = `git remote -v`
                if remote.empty?
                    report += "\t-> No remotes set!\n"
                end
                if !report.empty?
                    full_report += "    #{leaf}\n#{report}\n"
                end
            end

            # Tell the user if there are any directories in the leaf pile
            # that don't exist in the filesystem
            if @cleaner_results[:dont_exist].length > 0
                full_report += "\nThe following directories were not found!\n"
                full_report += "Consider removing them from ~/.leaf-pile\n\n"
                @cleaner_results[:dont_exist].each do |thing|
                    full_report += " -> #{thing}\n"
                end
            end

            full_report
        end

        def get_leaf_pile
            begin
                # Grab the leaf pile file
                # Run it through the wash
                pile_file = File.read(File.expand_path('~/.leaf-pile'))
            rescue
                puts "Error: no ~/.leaf-pile!"
                exit 1
            end
            Cleaner.clean pile_file
        end
    end
end
