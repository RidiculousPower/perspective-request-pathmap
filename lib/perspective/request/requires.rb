
basepath = 'path_map'

files = [

  'definition',
  'matching',
  'urls',
  'base_path'

]

files.each do |this_file|
  require_relative( File.join( basepath, this_file ) + '.rb' )
end
