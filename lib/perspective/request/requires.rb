# -*- encoding : utf-8 -*-

basepath = 'pathmap'

files = [

  'definition',
  'matching',
  'urls',
  'basepath'

]

files.each do |this_file|
  require_relative( File.join( basepath, this_file ) + '.rb' )
end
