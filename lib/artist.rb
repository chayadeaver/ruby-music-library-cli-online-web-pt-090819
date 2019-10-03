class Artist
    extend Concerns::Findable

    attr_accessor :name, :songs, :genre

    @@all = []

    def self.all
        @@all
    end


    def initialize(name)
        @name = name
        @songs = []
    end

    def save
        @@all << self
    end

    def add_song(song)
        song.artist = self unless song.artist 
        @songs << song unless @songs.include?(song)
    end

    def genres
        @songs.collect{|song|song.genre}.uniq
    end


    def self.create(artist_name)
        (artist = self.new(artist_name)).save
        artist
    end

    def self.destroy_all
        self.all.clear
    end

end