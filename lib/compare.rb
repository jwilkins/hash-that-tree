require 'digest/md5'

# Author::    John Ryan  (mailto:555john@gmail.com)
# Copyright:: Copyright (c) 2012 John Ryan
# License::   Distributes under the same terms as Ruby

module HashThatTree
  
  # This class accepts two folders and provides methods to iterate
  # through them creating a hash of each file within and can display 
  # the results for analysis 
	class CompareMD5
    attr_accessor :folder1 #path to folder containing files to hash
    attr_accessor :folder2 #path to folder containing files to hash to be compared to folder1
	  attr_accessor :format  #the format to output the results to. csv, html or json
	   
	   #initialize the class with the folders to be compared
  	 def initialize(folder1, folder2, options)
  	   @folder1 = folder1
  	   @folder2 = folder2
  	   @format = options['output']
  	   @filehash = Hash.new
			 validate
		end
	
		
		# Validates the input ensuring the arguments are both valid folders
		def validate
			if(folder1==nil) || (folder1=="") || !Dir.exists?(folder1)
				puts "a valid folder path is required as argument 1"
				exit
			end
					
			if(folder2==nil) || (folder2=="")  || !Dir.exists?(folder2)
				puts "a valid folder path is required as argument 2"
				exit
			end
			
		end
		
		# Iterates through the folders and creates a FileHashResults object containing the
		# results of the comparisson
		def compare
			
			Dir.foreach(@folder1) do |item|
				begin
  				next if item == '.' or item == '..'
  				fullfilename = File.expand_path(@folder1, item)
  				the_hash = Digest::MD5.hexdigest(File.read(File.join(File.expand_path(@folder1), item)))
  				item = item.downcase
  				filedata = FileHashResults.new(item, the_hash, nil)
  				@filehash[item] = filedata
  			rescue
  			  #puts "Skipped:#{item.inspect}"
  			end
			end

			Dir.foreach(@folder2) do |item|
			  begin
  				next if item == '.' or item == '..'
  				the_hash = Digest::MD5.hexdigest(File.read(File.join(@folder2, item)))
  				item = item.downcase
          if(@filehash[item]==nil)
  					filedata = FileHashResults.new(item, nil, the_hash)
  					@filehash[item] = filedata
  					next
  				end
  				@filehash[item.downcase].file_hash2 = the_hash
  			rescue
          #puts "Skipped:#{item.inspect}"
        end	
			end
		end

    #print the contents of the FileHashResults object standard out in the format specified. Default is csv
		def display_results()
		   case @format
        when "csv"
          display_results_csv
        when "html"
          display_results_html
        when "json"
          display_results_json
        else
          display_results_csv
        end
    end
    
    #Prints the results to standard out in the csv format specified.
		def display_results_csv
			puts "FileName,#{@folder1},#{@folder2},Are Equal"
			@filehash.each{ |key, value| puts "#{value.file_name},#{value.file_hash1},#{value.file_hash2}, #{value.file_hash1==value.file_hash2}" }
		end
		
		#Prints the results to standard out in the csv format specified.
    def display_results_html
		  output ="<!DOCTYPE html><html xmlns=\"http://www.w3.org/1999/xhtml\"><head><title></title></head><body>"
		  output.concat("<table><thead><tr><td>FileName</td></tr><tr><td>#{@folder1}</td></tr><tr><td>#{@folder2}</td></tr><tr><td>Equal</td></tr></thead>")
      @filehash.each{ |key, value| output.concat("<tbody><tr><td>#{value.file_name}</td></tr><tr><td>#{value.file_hash1}</td></tr><tr><td>#{value.file_hash2}</td></tr><tr><td>#{value.file_hash1==value.file_hash2}</td></tr>")}
      output.concat("</tbody></table></body></html>")
      puts output
    end
    
    #Prints the results to standard out in the csv format specified.
    def display_results_json
      puts @filehash 
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
