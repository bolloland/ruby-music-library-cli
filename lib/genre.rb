
require 'pry'
class Genre
    extend Concerns::Findable #extends this module (and its methods) into Genre
    attr_accessor :name, :song, :genre
    attr_reader 

        @@all = []

    def initialize(name)
        @name = name
        save
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end
    
    def save
        @@all << self
    end

    def self.create(name)
        genre = new(name)
        genre.save
        genre
    end

    def songs
        @songs
    end

    def add_song(song)
        song.genre = self unless song.genre
        #makes the song's genre THAT genre, 
        #unless the song HAS an genre (song.genre is true)
        @songs << song unless @songs.include?(song)
        #pushes the new song into @songs array, UNLESS
        #that song already exists in there.
        end

    def artists
        xx = @songs.map {|s| s.artist}
        xx.uniq
    end
#binding.pry

end