# -*- encoding : utf-8 -*-

class ::Perspective::Request::Pathmap::BasePath < ::Perspective::Request::Pathmap
  
  #####################
	#  match_condition  #
  #####################

  def match_condition( path, request_path )
    
    return path.match( request_path )
    
  end
  
end
