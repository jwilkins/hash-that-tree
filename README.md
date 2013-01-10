#hash-that-tree
A ruby command line app prints the MD5 hashes all of the files in an array of folders. 
The output can be in standard text, csv, html or json. 

Also has a compare functionthat takes 2 folder, then iterates through the files and comparing the MD5 hashes of the files with the same name

## Usage
	# to view help	
	hashthattree help
	
	# Get the hash of all files in a folder (with optional formatting)
	hashthattree hashit ./spec/testfiles/1 
	hashthattree hashit ./spec/testfiles/1 -o=csv
	hashthattree hashit ./spec/testfiles/1 -o=html
	hashthattree hashit ./spec/testfiles/1 -o=json
	
	# Get the hash of all files in multiple folders 
	hashthattree hashit ./spec/testfiles/1 
	
	# run the app on the test files in two folders (this will soon be depreciated)
	hashthattree compare ./spec/testfiles/1 ./spec/testfiles/2
	hashthattree compare ./spec/testfiles/1 ./spec/testfiles/2 csv
	hashthattree compare ./spec/testfiles/1 ./spec/testfiles/2 html
	hashthattree compare ./spec/testfiles/1 ./spec/testfiles/2 json

## Installation

Add this line to your application's Gemfile:

    gem 'hash-that-tree'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash-that-tree

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

	[x] Add MD5
	[x] Allow for single or multiple folders
	[x] Format output in json 
	[x] Format output in html
	[x] Format output in csv
	[ ] Add Unit Tests
	[ ] Allow to be used as an API as well as a Command Line Tool
	[ ] Add folder recursion option
	[ ] Add SHA1 

