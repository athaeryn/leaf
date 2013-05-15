module Leaf
    class ArgParser
        def self.parse args
            options = {}
            options[:raw] = args
            options
        end
    end
end
