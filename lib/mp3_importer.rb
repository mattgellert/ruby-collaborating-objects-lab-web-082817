require 'pry'



class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
    # files = Dir.glob(path).select {|file| file.slice!('../db/mp3s/')}
  end

  def files
    Dir.glob("#{self.path}/*").select {|file| file.slice!('./spec/fixtures/mp3s/')}
  end

  def import
    # if self.class == String
    #   Song.new_by_filename(file_name)
    # else
    #   self.each {|file_name|
    #     Song.new_by_filename(file_name)
    #   }
    # end
    Song.new_by_filename(files)
  end
end
