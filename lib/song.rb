

class Song
    attr_accessor :name, :genre, :create
    attr_reader :artist

        @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
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
    
    def artist=(artist)
        @artist = artist 
        artist.add_song(self)
    end
    
    def genre=(genre)
        @genre = genre 
        genre.add_song(self)
    end
    
    def self.create(name)
        self.new(name)
        @@all << self
        self
    end
    
    def self.find_by_name(name)
        binding.pry
        self.all.find {|song| song.name.equal? name}
    end
    
    def self.find_or_create_by_name(name)
        if find_by_name(name)
            same_song = find_by_name(name)
        else 
            create(name)   
        end
        @@all.delete(same_song)
        # binding.pry
    end
end