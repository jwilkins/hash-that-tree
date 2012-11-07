# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "hash-that-tree"
  gem.version       = "0.0.9"
  gem.authors       = ["John Ryan"]
  gem.email         = ["555john@gmail.com"]
  gem.description   = "Command line app that compares the MD5 hashes of the files in different folders"
  gem.summary       = "Allows the user to enter folder locations iterating through the files, creating and comparing the MD5 hashes of the files with the same name"
  gem.homepage      = "http://github.com/jnyryan/hash-that-tree"
  gem.extra_rdoc_files = [    "LICENSE.txt",    "README.md"  ]
  gem.files         = `git ls-files`.split($/)
  #gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.file(f) }
  gem.executable   = 'hashthattree'
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "thor"
end
