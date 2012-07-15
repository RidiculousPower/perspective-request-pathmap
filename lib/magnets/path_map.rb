
begin ; require 'development' ; rescue ::LoadError ; end

require 'magnets/path'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

class ::Magnets::PathMap

  # A PathMap is a grouping of one or more paths under one name. 
  # The name can then be used in combination with named parameters to construct an output url. 
  
  include ::Magnets::PathMap::Definition
  include ::Magnets::PathMap::Matching
  include ::Magnets::PathMap::URLs
  
end
