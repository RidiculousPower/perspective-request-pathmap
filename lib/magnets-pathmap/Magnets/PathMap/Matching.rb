
module ::Magnets::PathMap::Matching

  ###########
	#  match  #
	###########
	
	def match( request_path )
	  
	  matched = false
	  
	  paths_count = paths.count
	  
	  paths.each do |this_path|
	    
	    request_path.attach_to_path_definition( this_path )
	    
	    # if we match _and_ have no more parts left then we match this path
	    break if matched = this_path.match( request_path ) and ! request_path.current_part
	    
    end
    
    return matched
	  
  end

end
