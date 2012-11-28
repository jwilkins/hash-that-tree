# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = %q{hash-that-tree}
  gem.version       = "0.1.3"
  gem.authors       = ["John Ryan"]
  gem.email         = ["555john@gmail.com"]
  gem.description   = %q{Command line app that compares the MD5 hashes of the files in different folders}
  gem.summary       = %q{Allows the user to enter folder locations iterating through the files, creating and comparing the MD5 hashes of the files with the same name}
  gem.homepage      = %q{http://github.com/jnyryan/hash-that-tree}
  
  gem.extra_rdoc_files = ["LICENSE.txt","README.md"  ]
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.executable    = 'hashthattree'
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.rdoc_options << '--exclude spec/testfiles'
  
  gem.add_dependency "mustache"
  gem.add_dependency "redcarpet"
  gem.add_dependency "thor"
  gem.add_dependency "yard"
  
end
