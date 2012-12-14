require 'digest/md5'

# Author::    John Ryan  (mailto:555john@gmail.com)
# Copyright:: Copyright (c) 2012 John Ryan
# License::   Distributes under the same terms as Ruby
module HashThatTree
  # This class accepts a folder array and provides methods to iterate
  # through all files in the folder creating a hash of each file within.
  # The results are displayed to Standard Out in csv, html, json or standard format 
	class HashIt
    attr_accessor :format         #the format to output the results to - standard, csv, html or json
    attr_accessor :folders        #path to folder containing files to hash
    attr_accessor :file_data      #the container for the hashing results
    attr_accessor :error_data   #the container for the files that could not be processed
     
	   #initialize the class with the folders to be processed
  	 def initialize(options, folders )
  	   @format = options['output']
  	   @folders = folders
  	   @file_data = []
  	   @error_data = []
			 validate
		end
		
		# Validates the supplied folders ensuring they exist
		def validate
			@folders.each do |item|
        if(item==nil) || (item=="") || !Dir.exists?(item)
          puts "a valid folder path is required as argument #{item}"
          exit
        end
      end
		end
		
		# Iterates through the folders and creates a FileHashResults object containing the
    # results of the comparisson
    def create_hash_results
      
      @folders.each do |folder|
        Dir.foreach(folder) do |item|
          begin
            next if item == '.' or item == '..'
            fullfilename = File.expand_path(folder, item)
            the_hash = Digest::MD5.hexdigest(File.read(File.join(File.expand_path(folder), item.downcase)))
            @file_data << {:filename=>item, :folder=>folder, :filehash => the_hash}
          rescue
            @error_data << {:error=>"Skipped#{File.expand_path(folder, item)}"}
          end
        end
      end
    end
	end 
end
