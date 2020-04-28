class Artist
    attr_accessor :name, :songs, :genres

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @genres = []
        @@all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def new_song(name, genre)
        Song.new(name, self, genre)
    end

    def genres
        songs.each do |song|
            @genres << song.genre if !( @genres.include?(song.genre) )
        end

        @genres
    end

    def self.all
        @@all
    end
end