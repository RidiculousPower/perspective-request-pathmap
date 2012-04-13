
module ::Magnets::PathMap::Definition
  
  include ::CascadingConfiguration::Array
  include ::CascadingConfiguration::Array::Unique
    
  ################
  #  initialize  #
  ################
  
  def initialize( name, *paths_and_or_parts )
    
    @name = name
    
    paths.concat( paths_and_or_parts )
    
  end

  ###########
  #  paths  #
  ###########
  
  attr_configuration_unique_array  :paths do
    
    #=======#
    #  []=  #
    #=======#
    
    def []=( index, paths_and_or_parts )
      
      paths = nil
      path = nil
      
      if paths_and_or_parts.is_a?( Array )
        paths = ::Magnets::Path::Parser.regularize_path_or_parts( *paths_and_or_parts )
      else
        path = paths_and_or_parts
      end
      
      if path
        
        super( index, path )
        
      else
        
        # if the index already exists, replace it with the first element and insert the rest after
        if index < count
        
          first_item = paths.shift
        
          super( index, first_item )

          insert( index, *paths )

          # add it back on so we can return paths as added
          paths.unshift( first_item )
        
        # otherwise, insert them all
        else

          insert( index, *paths )
      
        end
      
      end
    
      return path || paths
      
    end
    
    #==========#
    #  insert  #
    #==========#
    
    def insert( index, *paths_and_or_parts )

      super( index, *::Magnets::Path::Parser.regularize_path_or_parts( *paths_and_or_parts ) )
      
    end

    #========#
    #  push  #
    #========#

    def push( *paths_and_or_parts )

      super( *::Magnets::Path::Parser.regularize_path_or_parts( *paths_and_or_parts ) )

    end

    #==========#
    #  concat  #
    #==========#

    def concat( *paths_and_or_parts )

      paths_and_or_parts.each do |this_paths_and_or_parts|

        super( *::Magnets::Path::Parser.regularize_path_or_parts( *this_paths_and_or_parts ) )
        
      end
      
      return self

    end

    #===========#
    #  replace  #
    #===========#

    def replace( paths_and_or_parts )

      super( ::Magnets::Path::Parser.regularize_path_or_parts( *paths_and_or_parts ) )

    end
    
    #===========#
    #  unshift  #
    #===========#
    
    def unshift( *paths_and_or_parts )
      
      super( *::Magnets::Path::Parser.regularize_path_or_parts( *paths_and_or_parts ) )
      
    end
    
  end
  
	################
	#  view_stack  #
	################
	
  attr_configuration_array  :view_stack
  
end
