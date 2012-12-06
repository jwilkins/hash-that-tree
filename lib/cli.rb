require 'thor'
require_relative 'compare'
require_relative 'hashit'
require_relative 'display'

# Command Line Program that  takes two directories and creates a MD5 hash for every file contained within.<br/>
# It then builds a result set that compares files with the same name and allows for them to be outputted
# as a csv string
module HashThatTree
  #This class controls the Command Line Interface
  class CLI < Thor
  	#Create a hash of all files in the folders, compare them and output the results in CSV format
    desc "compare FOLDER1 FOLDER2", "Create a hash of all files in the folders, compare them and output the results in the specified format"
    method_option :output, :aliases => "-o", :default => :csv, :desc => "Choose the format to display the results in - csv, json or html"
    def compare(folder1, folder2)
      htt = CompareMD5.new(folder1, folder2, options)
      htt.compare
      htt.display_results
    end
    
    desc "hashit FOLDERS", "Create a hash of all files in all folder supplied"
    method_option :hashtype, :aliases => "-h", :default => "cmd5", :desc => "Choose the hash algorithm to use - md5 or sha"
    method_option :output, :aliases => "-o", :default => "csv", :desc => "Choose the format to display the results in - csv, json or html"
    method_option :recursive, :aliases => "-r", :type => :boolean, :default => "false", :desc => "true = recurse through sub directories, false = only do top directory"
    def hashit(*folders)
      htt = HashIt.new(options, folders)
      htt.create_hash_results
      dis = Display.new(options, htt.file_data)
      dis.display_results()
    end
    
  end  
  #CLI.start(ARGV)
  CLI.start()
end