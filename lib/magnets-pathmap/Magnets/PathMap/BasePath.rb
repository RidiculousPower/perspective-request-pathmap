
class ::Magnets::PathMap::BasePath < ::Magnets::PathMap
  
  #####################
	#  match_condition  #
  #####################

  def match_condition( path, request_path )
    
    return path.match( request_path )
    
  end
  
end
