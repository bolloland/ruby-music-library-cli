require 'pry'
require_relative "../lib/music_importer.rb"

class MusicLibraryController

    attr_accessor :filepath, :library, :name, :artist

    

    def initialize(filepath = "./db/mp3s")
        @filepath = filepath
       
        MusicImporter.new(filepath).import
    end

    def call
        # while input != exit
       puts "Welcome to your music library!"
       puts "To list all of your songs, enter 'list songs'."
       puts "To list all of the artists in your library, enter 'list artists'."
       puts "To list all of the genres in your library, enter 'list genres'."
       puts "To list all of the songs by a particular artist, enter 'list artist'."
       puts "To list all of the songs of a particular genre, enter 'list genre'."
       puts "To play a song, enter 'play song'."
       puts "To quit, type 'exit'."
       puts "What would you like to do?"
       #binding.pry 
        input = gets.strip 
        case input
        when "list songs"
            list_songs
        when "list artists"
            list_artists
        when "list genres"
            list_genres
        when "list artist"
            list_songs_by_artist
        when "list genre"
            list_songs_by_genre
        when "play song"
            play_song
        when "exit"
            "exit"
        else
            call
        #     if input != "exit"
        #     call
        # else
        #     "exit"
        end
    end

   # CLI Methods

    def list_songs
        Song.all.sort_by(&:name).each.with_index(1) do |s, i|
            puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
            
            ###(&:name) >>  shortcut for {|song| song.name}
        end
     end

    def list_artists
    Artist.all.uniq.sort_by(&:name).each.with_index(1) do |a, i|
          #binding.pry
        puts "#{i}. #{a.name}"
            # end
        ###(&:name) >>  shortcut for {|song| song.name}
        end
    end

    def list_genres
    Genre.all.uniq.sort_by(&:name).each.with_index(1) do |g, i|
        puts "#{i}. #{g.name}"
        # end
        ###(&:name) >>  shortcut for {|song| song.name}
        end
    end    

    def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets:strip
    #puts "Testing for #{artist_input}"
    #"Bob Dylan" 1. Does he exist? 2. If so, find all his songs. 3. Alphabetize them and p them.
    if artist_x = Artist.find_by_name(artist_input)
        #binding.pry
        artist_x.songs.uniq.sort_by(&:name).each.with_index(1) do |a, i|
            puts "#{i}. #{a.name} - #{a.genre.name}" 
            end
        end
    end

def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets:strip
    #puts "Testing for #{genre_input}"
    #"folk" 1. Does it exist? 2. If so, find all those songs. 3. Alphabetize them and p them.
    if genre_x = Genre.find_by_name(genre_input)
         genre_x.songs.sort_by(&:name).each.with_index(1) do |g, i|
            puts "#{i}. #{g.artist.name} - #{g.name}" 
        end
    end
end

def play_song
    
    puts "Which song number would you like to play?"
    song_input = gets.strip.to_i
 
    if (1..Song.all.count).include?(song_input)
        Song.all.sort_by(&:name).each.with_index(1) do |s, i|
   #binding.pry 
        if i == song_input
            puts "Playing #{s.name} by #{s.artist.name}"
           #{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}
        end
        end
    end
    
end



end