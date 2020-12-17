
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
        if song.genre == nil
            song.genre = self
        end
       if !@songs.include?(song)
        @songs << song
       end
    end

    def artists
        xx = @songs.map {|s| s.artist}
        xx.uniq
    end
#binding.pry

end