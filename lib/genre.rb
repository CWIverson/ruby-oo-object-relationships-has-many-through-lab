class Genre
    attr_reader :name
    @@all=[]
    def initialize(name)
        @name=name
        @songs=[] 
        @@all<<self
    end
    def songs
        Song.all.each do |song|
            if song.genre == self && !(@songs.include?(song))
                @songs<<song
            end
        end
    end
    def self.all
        @@all
    end
    def artists
        songs.map do |song|
            song.artist
        end
    end
end
