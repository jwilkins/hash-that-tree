require 'digest/md5'

class HashThatTree
	attr_accessor :folder1, :folder2
 
	def initialize(folder1, folder2)
		@folder1 = folder1
		@folder2 = folder2
		@filehash = Hash.new
		usage
	end
	def usage
		if(folder1==nil) || (folder1=="") || !Dir.exists?(folder1)
			puts "a valid folder path is required as argument 1"
			exit
		end
				
		if(folder2==nil) || (folder2=="")  || !Dir.exists?(folder2)
			puts "a valid folder path is required as argument 2"
			exit
		end
		
	end
	
	def compare_folders
		
		Dir.foreach(@folder1) do |item|
			next if item == '.' or item == '..'
			the_hash = Digest::MD5.hexdigest(File.read(File.join(@folder1, item)))
			filedata = FileData.new(the_hash, nil)
			@filehash[item] = filedata
		end

		Dir.foreach(@folder2) do |item|
			next if item == '.' or item == '..'
			the_hash = Digest::MD5.hexdigest(File.read(File.join(@folder2, item)))
			if(@filehash[item]==nil)
				filedata = FileData.new(nil, the_hash)
				@filehash[item] = filedata
				next
			end
			@filehash[item].file2 = the_hash	
		end
	end

	def display_results
		puts "FileName                Hash1               Hash2"
		@filehash.each{ |key, value| puts "#{key} is #{value.file1} #{value.file2}" }
	end
end

class FileData
 attr_accessor :file1, :file2
 def initialize(file1, file2)
    @file1 = file1
    @file2 = file2
  end
end

htt = HashThatTree.new(ARGV[0], ARGV[1])
htt.compare_folders
htt.display_results