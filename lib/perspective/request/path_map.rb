
begin ; require 'development' ; rescue ::LoadError ; end

require 'perspective/request/path'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

class ::Perspective::Request::PathMap

  # A PathMap is a grouping of one or more paths under one name. 
  # The name can then be used in combination with named parameters to construct an output url. 
  
  include ::Perspective::Request::PathMap::Definition
  include ::Perspective::Request::PathMap::Matching
  include ::Perspective::Request::PathMap::URLs
  
end
