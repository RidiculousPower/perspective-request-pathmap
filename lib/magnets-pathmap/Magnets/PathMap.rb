
class ::Magnets::PathMap

  # A PathMap is a grouping of one or more paths under one name. 
  # The name can then be used in combination with named parameters to construct an output url. 
  
  include ::Magnets::PathMap::Definition
  include ::Magnets::PathMap::Matching
  include ::Magnets::PathMap::URLs
  
end
