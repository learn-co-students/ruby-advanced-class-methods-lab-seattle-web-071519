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
    @@all << song 
    song
  end 

  def self.new_by_name(name)
    song = Song.new
    song.name = name 
    song 
  end 

  def self.create_by_name(name)
    song = self.new
    song.name = name 
    @@all << song 
    song 
  end 

  #using all.find goes through the array of songs looking for a song name 
  def self.find_by_name(name)
   self.all.find do |song|
    song.name == name 
    # binding.pry
  end 
end 

#this method calls on the preivous made methods (find_by_name) and (create_by_name) instead of repeating another code method 
#returns the exisitng Song obj - not creating a new one when provided the title of exisiting Song
#use self.on both to call the (name) of a song in the class 
def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
end 
  

  def self.alphabetical()
  @@all.sort_by{|x| x.name}
  end 

def Song.new_from_filename(filename)
  #initializes a new song / artist based on file name format
  filename = filename[0...-4].split(" - ")
  song = new_by_name(filename[1])
  song.artist_name = filename[0]
return song

end

def Song.create_from_filename(filename)
  #initializes and saves a song and artist_name based on file name format
  filename = filename[0...-4].split(" - ")
  song = create_by_name(filename[1])
  song.artist_name = filename[0]
  @@all << song 
  return song
end 

def Song.destroy_all
  @@all = []
end 
end 




  
