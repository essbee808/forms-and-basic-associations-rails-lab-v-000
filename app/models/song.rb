class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    #setter method is called whenever Song is initialized with an artist_name field
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
    self.genre ? self.genre.name : nil
  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes.build(content: ote, song_id: self.id) unless note.blank?
    end
  end

  def note_contents
    note_contents = []
    self.notes.each do |note|
      note_contents << note.content
    end
  end

end
