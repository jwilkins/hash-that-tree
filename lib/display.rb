require 'digest/md5'
require 'mustache'

# Author::    John Ryan  (mailto:555john@gmail.com)
# Copyright:: Copyright (c) 2012 John Ryan
# License::   Distributes under the same terms as Ruby

module HashThatTree
  
	class Display
    attr_accessor :format  #the format to output the results to. csv, html or json
    attr_accessor :file_data #path to folder containing files to hash
     
	   #initialize the class with the folders to be compared
  	 def initialize(options, *file_data )
  	   @format = options['output']
  	   @file_data = file_data
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
			#puts "FileName,#{@folder1},#{@folder2},Are Equal"
			#@hash_results.each{ |key, value| puts "#{value.file_name},#{value.file_hash1},#{value.file_hash2}, #{value.file_hash1==value.file_hash2}" }
			
			p @file_data
			
template = <<-TEMPLATE
			{{#for_mustache}}
          <div>
              <h1>{{#filename}}</h1>
              <p>{{folder}}<br/>{{filehash}}</p>
          </div>
      {{/for_mustache}}
 TEMPLATE

    html = Mustache.render(template, @file_data);
    puts html
		end
		
		#Prints the results to standard out in the csv format specified.
    def display_results_html
		  output ="<!DOCTYPE html><html xmlns=\"http://www.w3.org/1999/xhtml\"><head><title></title></head><body>"
		  output.concat("<table><thead><tr><td>FileName</td></tr><tr><td>#{@folder1}</td></tr><tr><td>#{@folder2}</td></tr><tr><td>Equal</td></tr></thead>")
      @hash_results.each{ |key, value| output.concat("<tbody><tr><td>#{value.file_name}</td></tr><tr><td>#{value.file_hash1}</td></tr><tr><td>#{value.file_hash2}</td></tr><tr><td>#{value.file_hash1==value.file_hash2}</td></tr>")}
      output.concat("</tbody></table></body></html>")
      puts output
    end
    
    #Prints the results to standard out in the csv format specified.
    def display_results_json
      p @hash_results 
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
