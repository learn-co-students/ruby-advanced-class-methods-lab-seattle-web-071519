class Song
  attr_accessor :name, :artist_name
  @@all = []


  def Song.create
    new_song = Song.new
    @@all << new_song
    return new_song
  end

  def Song.create_by_name(name)
    new_song = Song.new 
    new_song.name = name
    @@all << new_song
    return new_song
  end  
  
  def Song.new_by_name(name)
  new_song = Song.new 
  new_song.name = name
  return new_song
  end

  def Song.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def Song.find_or_create_by_name(name)
      if !!!Song.find_by_name(name)
        Song.create_by_name(name)
      end
      Song.find_by_name(name)
  end

  def Song.alphabetical
      list = @@all
      list.sort do |a,b|
        a.name <=> b.name
      end
  end

  def Song.new_from_filename(filename)
      filename = filename[0...-4].split(" - ")
      song = new_by_name(filename[1])
      song.artist_name = filename[0]
      return song
  end

  def Song.create_from_filename(filename)
      filename = filename[0...-4].split(" - ")
      song = new_by_name(filename[1])
      song.artist_name = filename[0]
      @@all << song
      return song
  end

  def Song.destroy_all
    @@all = []
  end

  def initialize
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
