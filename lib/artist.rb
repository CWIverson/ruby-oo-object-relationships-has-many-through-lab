class Artist
@@all=[]
    attr_reader :name
    def initialize(name)
        @name = name
        @songs= []
        @@all<< self
    end
    def self.all
        @@all
    end
    def songs
        Song.all.each do |song|
            if song.artist == self && !(@songs.include?(song))
                @songs<<song
            end
        end
        @songs
    end
    def new_song(name, genre)
        Song.new(name, self, genre)
    end
    def genres
        songs.map do |song|
            song.genre
        end
    end
end
