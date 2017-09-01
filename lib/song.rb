require 'pry'
class Song
  attr_accessor :name, :artist

  def self.helper(file_name)
    song_array = file_name.split(" - ")
    song = Song.new(song_array[1])
    if Artist.all.any? {|artist| artist.name == song_array[0]} == true
      Artist.all.each {|artist|
        if artist.name == song_array[0]
          song.artist = artist
        end
      }
    else
      song.artist = Artist.new(song_array[0])
      song.artist.add_song(song)
      song.artist.save
    end
    song
  end

  def self.new_by_filename(file_name)
    #binding.pry
    if file_name.class == String
      self.helper(file_name)
    elsif file_name.class == Array
      file_name.each {|song_details|
        self.helper(song_details)
      }
    end
  end

  def initialize(name)
    @name = name
  end
end
