require 'pry'
class Artist
  attr_accessor :name

  @@all = []

  def self.find_or_create_by_name(artist_name)
    if self.all.any? {|artist| artist.name == artist_name} == true
      self.all.find {|artist| artist.name == artist_name}
    else
      Artist.new(artist_name)
    end
  end

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end

end
