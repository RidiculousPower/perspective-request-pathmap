# -*- encoding : utf-8 -*-

require 'perspective/request/path'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

class ::Perspective::Request::Pathmap

  # A Pathmap is a grouping of one or more paths under one name. 
  # The name can then be used in combination with named parameters to construct an output url. 
  
  include ::Perspective::Request::Pathmap::Definition
  include ::Perspective::Request::Pathmap::Matching
  include ::Perspective::Request::Pathmap::URLs
  
end
