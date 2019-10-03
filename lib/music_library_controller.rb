require 'pry'
class MusicLibraryController
    attr_accessor :path

    def initialize(path = "./db/mp3s")
        @path = path
        MusicImporter.new(path).import
    end

    def call
        user = ""

        while user != "exit"
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts"To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"

        user = gets.chomp

        case user

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
        end

        # if user == "list songs"
        #     list_songs
        # end
        end
    end

    def list_songs
        Song.all.sort_by{|song| song.name}.each.with_index(1) do |song, index|
            puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"

        end
    end

    def list_artists
        Artist.all.sort_by{|artist| artist.name}.each.with_index(1) do |artist, index|
            puts "#{index}. #{artist.name}"
        end
    end

    def list_genres
        Genre.all.sort_by{|genre| genre.name}.each.with_index(1) do |genre, index|
            puts "#{index}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user = gets.chomp
        find_artist = Artist.find_by_name(user)
        if find_artist
            find_artist.songs.sort_by{|artist| artist.name}.each.with_index(1) do |artist, index|
                # binding.pry
               puts "#{index}. #{artist.name} - #{artist.genre.name}"
            end
        end
    end
    
    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        user = gets.chomp
        find_genre = Genre.find_by_name(user)
        if find_genre
            find_genre.songs.sort_by{|genre| genre.name}.each.with_index(1) do |genre, index|
                # binding.pry
               puts "#{index}. #{genre.artist.name} - #{genre.name}"
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        user = gets.chomp.to_i
        song_list = Song.all.sort_by{|song| song.name}
        # binding.pry
        if user <= song_list.length && user > 0
            song_choice = song_list[user - 1]
        end
        if song_choice 
        puts "Playing #{song_choice.name} by #{song_choice.artist.name}"
        end
        # binding.pry
    end
    
end



