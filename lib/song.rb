require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    #song.name = name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)

    return_song = ""
    @@all.each do |song|
      if song.name == name
        return_song = song
      end
    end

    return_song
  end

  def self.find_or_create_by_name(name)
    return_song = ""
    if @@all.include?(name)
      @@all.each do |song|
        if song.name == name
          return_song = song
        end
      end
    else
      return_song = self.create_by_name(name)
    end
    return_song
  end

  def self.alphabetical

    result = @@all.sort_by do |item|
      item.name
    end
    result

  end

  def self.new_from_filename(input)
    input_as_array = input.split('-')
    artist = input_as_array[0].strip
    name = (input_as_array[1].split('.'))[0].strip
    #binding.pry
    song = self.new
    song.name = name
    song.artist_name = artist
    song

  end

  def self.create_from_filename(input)
    input_as_array = input.split('-')
    artist = input_as_array[0].strip
    name = (input_as_array[1].split('.'))[0].strip

    song = self.create
    song.name = name
    song.artist_name = artist
    song
    binding.pry

  end

  def self.destroy_all
    @@all = []
  end

end


Song.create_from_filename("Thundercat - For love I come.mp3")
