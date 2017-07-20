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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    self.all.find { |song| song.name == title   }
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    tags = filename.split(" - ")
    tags.map { |x| x.chomp! ".mp3" }
    song = self.new
    song.name = tags[1]
    song.artist_name = tags[0]
    song
    # binding.pry
  end

  def self.create_from_filename(filename)
    tags = filename.split(" - ")
    tags.map { |x| x.chomp! ".mp3" }
    song = self.create
    song.name = tags[1]
    song.artist_name = tags[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
