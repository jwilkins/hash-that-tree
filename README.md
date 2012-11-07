#hash-that-tree
A ruby command line app that compares the MD5 hashes of the files in different folders

It allows the user to enter folder locations, then iterats through the files, creating and comparing the MD5 hashes of the files with the same name

## Installation

Add this line to your application's Gemfile:

    gem 'hash-that-tree'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash-that-tree

## Usage
	e.g
	
	hashthattree help
	
	hashthattree CompareMD5 spec/testfiles/1 spec/testfiles/2

	
## Creating Documentation
	Run the following command to generate the documantation
	
	rdoc --exclude spec/testfiles

## Create a gem
	
	Build and Test Locally
	-gem build hash-that-tree.gemspec
	-gem install hash-that-tree-X.X.X # where X.X.X is the version of the compiled gemspec
	-hashthattree
	
	Build and deploy to rubygems.org
	-gem update --system
	-gem build hash-that-tree.gemspec
	-gem push hash-that-tree-0.0.1.gem # where X.X.X is the version of the compiled gemspec

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

##References
	
	Looking into bundling with https://github.com/radar/guides/blob/master/gem-development.md
	http://whatisthor.com/

## TODO

	I have a few items to do in upcoming releases
	* Add Unit Tests
	* Allow to be used as an API as well as a Command Line Tool
	* Allow multiple folders to be specified
	* Add folder recursion option
	* Add SHA1 

