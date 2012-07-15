
require_relative '../../lib/magnets-pathmap.rb'

describe ::Magnets::PathMap do
  
  ################
  #  initialize  #
  ################
  
  it 'can bundle a set of paths with a name' do
    pathmap = ::Magnets::PathMap.new( :name, :variable, 'some/path', /parts/, ::Magnets::Path.new( 'some/path' ), 'some/other', 'path', ''  )
    pathmap.paths.count.should == 4
    pathmap.paths[ 0 ].count.should == 4
    pathmap.paths[ 0 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Variable ).should == true
    pathmap.paths[ 0 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Regexp ).should == true
    pathmap.paths[ 1 ].count.should == 2
    pathmap.paths[ 1 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ].count.should == 3
    pathmap.paths[ 2 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 3 ].count.should == 1
    pathmap.paths[ 3 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Empty ).should == true
  end

  ###########
  #  paths  #
  ###########

  it 'has a paths array that will create paths from descriptors when inserted' do
    
    pathmap = ::Magnets::PathMap.new( :name )
    pathmap.paths.count.should == 0    
    
    #==========#
    #  insert  #
    #==========#
    
    # empty insert
    pathmap.paths.insert( 0, :variable, 'some/path', /parts/, ::Magnets::Path.new( 'some/path' ) )
    pathmap.paths.count.should == 2
    pathmap.paths[ 0 ].count.should == 4
    pathmap.paths[ 0 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Variable ).should == true
    pathmap.paths[ 0 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Regexp ).should == true
    pathmap.paths[ 1 ].count.should == 2
    pathmap.paths[ 1 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true

    # insert before existing
    pathmap.paths.insert( 0, 'some/other', 'path', '' )
    pathmap.paths.count.should == 4
    pathmap.paths[ 0 ].count.should == 3
    pathmap.paths[ 0 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ].count.should == 1
    pathmap.paths[ 1 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Empty ).should == true
    pathmap.paths[ 2 ].count.should == 4
    pathmap.paths[ 2 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Variable ).should == true
    pathmap.paths[ 2 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Regexp ).should == true
    pathmap.paths[ 3 ].count.should == 2
    pathmap.paths[ 3 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 3 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true

    #=======#
    #  []=  #
    #=======#
  
    # replace with more than 1
    pathmap.paths[ 1 ] = ::Magnets::Path.new( 'some/third/path' ), 'some/other/another'
    pathmap.paths.count.should == 5
    pathmap.paths[ 0 ].count.should == 3
    pathmap.paths[ 0 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ].count.should == 3
    pathmap.paths[ 1 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ].count.should == 3
    pathmap.paths[ 1 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 3 ].count.should == 4
    pathmap.paths[ 3 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Variable ).should == true
    pathmap.paths[ 3 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 3 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 3 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Regexp ).should == true
    pathmap.paths[ 4 ].count.should == 2
    pathmap.paths[ 4 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 4 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    
    # insert of more than 1
    pathmap.paths[ 5 ] = ::Magnets::Path.new( 'a/path' )
    pathmap.paths.count.should == 6
    pathmap.paths[ 0 ].count.should == 3
    pathmap.paths[ 0 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ].count.should == 3
    pathmap.paths[ 1 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ].count.should == 3
    pathmap.paths[ 1 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 3 ].count.should == 4
    pathmap.paths[ 3 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Variable ).should == true
    pathmap.paths[ 3 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 3 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 3 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Regexp ).should == true
    pathmap.paths[ 4 ].count.should == 2
    pathmap.paths[ 4 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 4 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 5 ].count.should == 2
    pathmap.paths[ 5 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 5 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true

    #========#
    #  push  #
    #========#

    pathmap.paths.push( ::Magnets::Path.new( 'a/path/in/addition' ) )
    pathmap.paths.count.should == 7
    pathmap.paths[ 0 ].count.should == 3
    pathmap.paths[ 0 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ].count.should == 3
    pathmap.paths[ 1 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ].count.should == 3
    pathmap.paths[ 1 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 3 ].count.should == 4
    pathmap.paths[ 3 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Variable ).should == true
    pathmap.paths[ 3 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 3 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 3 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Regexp ).should == true
    pathmap.paths[ 4 ].count.should == 2
    pathmap.paths[ 4 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 4 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 5 ].count.should == 2
    pathmap.paths[ 5 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 5 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 6 ].count.should == 4
    pathmap.paths[ 6 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 6 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 6 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 6 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true

    #==========#
    #  concat  #
    #==========#

    pathmap.paths.concat( [ 'some/path/we/havent/added', ::Magnets::Path.new( 'a/path/in/addition/to/the/previous' ) ] )
    pathmap.paths.count.should == 9
    pathmap.paths[ 0 ].count.should == 3
    pathmap.paths[ 0 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ].count.should == 3
    pathmap.paths[ 1 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ].count.should == 3
    pathmap.paths[ 2 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 3 ].count.should == 4
    pathmap.paths[ 3 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Variable ).should == true
    pathmap.paths[ 3 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 3 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 3 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Regexp ).should == true
    pathmap.paths[ 4 ].count.should == 2
    pathmap.paths[ 4 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 4 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 5 ].count.should == 2
    pathmap.paths[ 5 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 5 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 6 ].count.should == 4
    pathmap.paths[ 6 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 6 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 6 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 6 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 7 ].count.should == 5
    pathmap.paths[ 7 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 7 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 7 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 7 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 7 ][ 4 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 8 ].count.should == 7
    pathmap.paths[ 8 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 8 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 8 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 8 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 8 ][ 4 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 8 ][ 5 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 8 ][ 6 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true

    #===========#
    #  replace  #
    #===========#
    
    pathmap.paths.replace( [ 'some/path/we/havent/added', ::Magnets::Path.new( 'a/path/in/addition/to/the/previous' ) ] )
    pathmap.paths.count.should == 2
    pathmap.paths[ 0 ].count.should == 5
    pathmap.paths[ 0 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 0 ][ 4 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ].count.should == 7
    pathmap.paths[ 1 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 4 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 5 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 6 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    
    #===========#
    #  unshift  #
    #===========#

    pathmap.paths.unshift( 'another_path' )
    pathmap.paths.count.should == 3
    pathmap.paths[ 0 ].count.should == 1
    pathmap.paths[ 0 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ].count.should == 5
    pathmap.paths[ 1 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 1 ][ 4 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ].count.should == 7
    pathmap.paths[ 2 ][ 0 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ][ 1 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ][ 2 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ][ 3 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ][ 4 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ][ 5 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    pathmap.paths[ 2 ][ 6 ].is_a?( ::Magnets::Path::PathPart::Constant ).should == true
    
  end

  ###########
	#  match  #
	###########

  it 'it can match for any path included in pathmap; first path definition to match wins' do
    pathmap = ::Magnets::PathMap.new( :name, :variable, 'some/path', /parts/, ::Magnets::Path.new( 'some/path' ), 'some/other', 'path', ''  )
    
    pathmap.match( ::Magnets::Path::RequestPath.new( 'and/some/path/parts' ) ).should == true
    pathmap.match( ::Magnets::Path::RequestPath.new( 'some/path' ) ).should == true
    pathmap.match( ::Magnets::Path::RequestPath.new( 'some/other/path' ) ).should == true
    pathmap.match( ::Magnets::Path::RequestPath.new( '' ) ).should == true

    pathmap.match( ::Magnets::Path::RequestPath.new( 'badpath' ) ).should == false
    pathmap.match( ::Magnets::Path::RequestPath.new( 'some/other/other/path' ) ).should == false
    pathmap.match( ::Magnets::Path::RequestPath.new( 'base/some/path' ) ).should == false
    pathmap.match( ::Magnets::Path::RequestPath.new( 'some/path/base' ) ).should == false
    pathmap.match( ::Magnets::Path::RequestPath.new( 'some/path/parts/and/some/others' ) ).should == false
    
  end
  
end
