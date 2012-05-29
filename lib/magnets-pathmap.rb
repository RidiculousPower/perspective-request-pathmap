
require_relative '../../path/lib/magnets-path.rb'

class ::Magnets::PathMap
  module Definition
  end
  module Matching
  end
  module URLs
  end
end

basepath = 'magnets-pathmap/Magnets/PathMap'

require_relative( basepath + '/Definition.rb' )
require_relative( basepath + '/Matching.rb' )
require_relative( basepath + '/URLs.rb' )
require_relative( basepath + '/Binding.rb' )
require_relative( basepath + '/BasePath.rb' )

require_relative( basepath + '.rb' )

class ::Magnets::Binding
  include ::Magnets::PathMap::Binding
end
