require 'pry'

class MusicImporter
        attr_accessor :path

        @@library = []

    def initialize(path)
        @path = path
    end
#"./db/mp3s"

    def files
        #binding.pry
        song_files = Dir.entries(@path)
        song_files.select {|s| s.include?("mp3")}
    end
    
    def import
        files.each {|f| @@library << Song.new_by_filename(f)} 
    end
    
end

