
require_relative '../../path/lib/magnets-path.rb'

require_relative '../../view/lib/magnets-view.rb'

module ::Magnets
  class PathMap
    module Definition
    end
    module Matching
    end
    module URLs
    end
  end
end

basepath = 'magnets-pathmap/Magnets/PathMap'

require_relative( basepath + '/Definition.rb' )
require_relative( basepath + '/Matching.rb' )
require_relative( basepath + '/URLs.rb' )
require_relative( basepath + '/Binding.rb' )

require_relative( basepath + '.rb' )

class ::Magnets::Bindings::Binding
  include ::Magnets::PathMap::Binding
end
