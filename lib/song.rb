

class Song
    attr_accessor :name, :genre, :create, :artist
    attr_reader 

        @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        @artist = artist ###>>??
        self.artist=(artist) if artist != nil
        self.genre=(genre) if genre != nil
        save
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

    
    def song_with_artist
        Song.new(self, @artist)
    end
    
    def artist=(artist) #self.artist?
        @artist = artist 
        artist.add_song(self)
    end
    
    def genre=(genre)#self.genre?
        @genre = genre 
        genre.add_song(self)
    end
    
    def self.create(name)
        song = new(name)
    end
    
    def self.find_by_name(name)
        self.all.find {|song| song.name == name}
    end
    
    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(filename)
        #binding.pry
        artist = filename.split(" - ")[0]
        name = filename.split(" - ")[1]
        genre = filename.split(" - ")[2].delete_suffix(".mp3")        
        self.new(name, artist, genre)
       
    end

    #  def artist_name=(artist_name)
    #self.artist = Artist.find_or_create_by_name(artist_name) 
    #end
end