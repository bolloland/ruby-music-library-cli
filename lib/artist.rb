
require 'pry'
# require_relative '../lib/concerns/findable.rb'
class Artist
    extend Concerns::Findable #brings this module (and its methods) into Artist
    attr_accessor :name, :song, :genre
    
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
        artist = new(name)
        artist.save
        #binding.pry
        artist
    end
        
    def songs
        @songs
    end

    def add_song(song)
        if song.artist == nil
            song.artist = self
        end
       if !@songs.include?(song)
        @songs << song
       end
        # x = Song.new(song)
        # x.artist = self
        # Song.all << x
    end

    def genres
        xx = @songs.map {|s| s.genre}
        xx.uniq
    end

     
end