#hash-that-tree
a ruby app that compares the MD5 hashes of the files in two different folders

Looking into bundling with https://github.com/radar/guides/blob/master/gem-development.md

## Installation

Add this line to your application's Gemfile:

    gem 'hash-that-tree'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash-that-tree

## Usage
	e.g
	hashthattree.rb c:/testfiles/folder1 c:/testfiles/folder2

	to test the app
	ruby lib/hashthattree.rb spec/testfiles/1 spec/testfiles/2

## Creating Documentation
	Run the following command to generate the documantation
	
	rdoc --exclude spec/testfiles

## Create a gem
	
	gem update --system
	gem build hash-that-tree.gemspec
	gem push hash-that-tree-0.0.1.gem

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
