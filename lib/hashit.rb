require 'digest/md5'

# Author::    John Ryan  (mailto:555john@gmail.com)
# Copyright:: Copyright (c) 2012 John Ryan
# License::   Distributes under the same terms as Ruby

module HashThatTree
 
	class HashIt
    attr_accessor :format  #the format to output the results to. csv, html or json
    attr_accessor :folders #path to folder containing files to hash
     
	   #initialize the class with the folders to be compared
  	 def initialize(options, folders )
  	   @format = options['output']
  	   @folders = folders
			 validate
		end
		
		# Validates the supplied folders ensuring they exist
		def validate
			@folders.each do |item|
        if(item==nil) || (item=="") || !Dir.exists?(item)
          puts "a valid folder path is required as argument #{item}"
          exit
        end
        p item
      end
      create_hash_results
		end
		
		# Iterates through the folders and creates a FileHashResults object containing the
    # results of the comparisson
    def create_hash_results
      @folders.each do |folder|
        Dir.foreach(folder) do |item|
          begin
            next if item == '.' or item == '..'
            fullfilename = File.expand_path(folder, item)
            the_hash = Digest::MD5.hexdigest(File.read(File.join(File.expand_path(folder), item)))
            item = item.downcase
            #filedata = FileHashResults.new(item, the_hash, nil)
            #@filehash[item] = filedata
            p item
            p the_hash
          rescue
            puts "Skipped:#{item.inspect}"
          end
        end
      end
    end
	end
	
	#Container for the results of the file comparisson 
	class FileHashResults
   attr_accessor :file_name, :file_hash1, :file_hash2
   def initialize(file_name, file_hash1, file_hash2)
    @file_name = file_name
    @file_hash1 = file_hash1
    @file_hash2 = file_hash2
    end
  end
end
