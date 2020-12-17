require 'bundler'
require 'pry'

Bundler.require

module Concerns
end

require_all 'lib' #this pulls EVERYTHING from the lib folder.
#Don't repeat yourself if this is here. aka, no re_re's needed from lib. 
#it's already been requested with this code.
