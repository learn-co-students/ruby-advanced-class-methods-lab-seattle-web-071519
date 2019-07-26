require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = Song.new
    song.save
    song
  end

def Song.new_by_name(new_song)
  song = Song.new
  song.name = new_song
  song
end

def Song.create_by_name(song)
  create_song = self.create
  create_song.name = song
  create_song
end

def self.find_by_name(song)
  Song.all.find do |s|
    if s.name == song
      song
    else 
      false
    end
  end
end

def self.find_or_create_by_name(song)
  self.find_by_name(song) || self.create_by_name(song)
end

def Song.alphabetical
    Song.all.sort_by do |s|
        s.name
    end
  end


#Tasks: "Taylor Swift - Blank Space.mp3" to Taylor Swift - Blank Space.mp3
#returns new Song instance 
#step 1: parse string, delete '.mp3' (#creates array of of words in the string)
#2: assign song.name to Blank Space and song.artist_name to Taylor Swift
#3: return a new Song instance
def self.new_from_filename(file)
  words = file.split(" - ")
  artistname = words[0]
  song = words[1][0..-5]
  # thissong = song[0..-5]

  newsong = self.new
  newsong.name = song
  newsong.artist_name = artistname
  newsong
  # binding.pry
end

def Song.create_from_filename(file)
  words = file.split(" - ")
  artistname = words[0]
  song = words[1][0..-5]
  # thissong = song[0..-5]

  newsong = self.create
  newsong.name = song
  newsong.artist_name = artistname
  newsong
end

def self.destroy_all
  self.all.clear
end

end

