require 'digest/md5'
require 'mustache'
require 'json'
require_relative '../templates/displaytemplates'

# Author::    John Ryan  (mailto:555john@gmail.com)
# Copyright:: Copyright (c) 2012 John Ryan
# License::   Distributes under the same terms as Ruby
module HashThatTree
  
	class Display
    attr_accessor :format  #the format to output the results to. csv, html or json
    attr_accessor :file_data #array of files and associated hashes
    attr_accessor :error_data #array of files that could not be processed
     
	   #initialize the class with the folders to be compared
  	 def initialize(options, error_data, *file_data )
  	   @format = options['output']
  	   @displayerrors = options['errors']
  	   @file_data = file_data
  	   @error_data = error_data
  	   p @error_data
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
          display_results_std
        end
    end
    
    #Prints the results to standard out in the csv format specified.
    def display_results_std
      puts Mustache.render(StandardTemplate,  :filedetails => @file_data[0]);
      if(@displayerrors)
        puts Mustache.render(StandardTemplate,  :errordetails => @error_data[0]);
      end
    end
    
    #Prints the results to standard out in the csv format specified.
		def display_results_csv
      puts Mustache.render(CsvTemplate,  :filedetails => @file_data[0]);
      if(@displayerrors)
        puts Mustache.render(CsvTemplate,  :filedetails => @error_data[0]);
      end
		end
		
		#Prints the results to standard out in the csv format specified.
    def display_results_html
		  puts Mustache.render(HtmlTemplate,  :filedetails => @file_data[0]);
      if(@displayerrors)
        puts Mustache.render(HtmlTemplate,  :filedetails => @error_data[0]);
      end
    end
    
    #Prints the results to standard out in the csv format specified.
    def display_results_json
      puts JSON.pretty_generate(@file_data) 
      if(@displayerrors)
        puts JSON.pretty_generate(@error_data) 
      end
    end
		
	end
end
