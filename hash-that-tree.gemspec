# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |gem|
  gem.name          = "hash-that-tree"
  gem.version       = HashThatTree::VERSION
  gem.authors       = ["John Ryan"]
  gem.email         = ["johnryan_irl@yahoo.com"]
  gem.description   = "compares the MD5 hashes of the files in two different folders"
  gem.summary       = "Allows the user to enter two folder locations and the gem will iterate through the files, creating and comparing the MD5 hashes of the files with the same name"
  gem.homepage      = "http://github.com/jnyryan/hash-that-tree"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
