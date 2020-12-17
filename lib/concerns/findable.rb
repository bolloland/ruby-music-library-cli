require 'pry'
module Concerns::Findable

        def find_by_name(name)
            #binding.pry
            self.all.detect {|x| x.name == name }
        end
        
        def find_or_create_by_name(name)
            self.find_by_name(name) || self.create(name)
        end

# in a module, the method titles need to go from class methods (self.) 
#to instance methods - compare these to the same methods in the Song class. 
end