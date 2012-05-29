
module ::Magnets::PathMap::Matching

  ###########
	#  match  #
	###########
	
	def match( request_path )
	  
	  matched = false
	  
	  paths_count = paths.count
	  
	  paths.each do |this_path|
	    
	    request_path.attach_to_path_definition( this_path )
	    
	    break if matched = match_condition( this_path, request_path )
	    
    end

    return matched
	  
  end

  #####################
	#  match_condition  #
  #####################

  def match_condition( path, request_path )
    
    # if we match _and_ have no more parts left then we match this path
    return path.match( request_path ) && ! request_path.current_part
    
  end

end
