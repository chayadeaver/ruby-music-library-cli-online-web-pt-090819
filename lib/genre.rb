class Genre
    extend Concerns::Findable

    attr_accessor :name, :songs, :artist

    @@all = []

    def self.all
        @@all
    end


    def initialize(name)
        @name = name
        @songs = []
    end

    def artists
        @songs.collect{|song| song.artist}.uniq
    end

    def save
        @@all << self
    end

    def self.create(genre_type)
        (genre = self.new(genre_type)).save
        genre
    end

    def self.destroy_all
        self.all.clear
    end

end