# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = %q{hash-that-tree}
  gem.version       = "0.1.4"
  gem.authors       = ["John Ryan"]
  gem.email         = ["555john@gmail.com"]
  gem.description   = %q{Command line app that produces the MD5 hash of all files in a set of folders}
  gem.summary       = %q{A ruby command line app prints the MD5 hashes all of the files in an array of folders, the output can be in standard text, csv, html or json}
  gem.homepage      = %q{http://github.com/jnyryan/hash-that-tree}
  
  gem.extra_rdoc_files = ["LICENSE.txt","README.md"  ]
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.executable    = 'hashthattree'
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.rdoc_options << '--exclude spec/testfiles'
  
  gem.add_dependency "mustache"
  gem.add_dependency "thor"
  gem.add_dependency "yard"
  
end
