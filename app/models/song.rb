class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :song
  belongs_to :genre

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    else
      nil
    end
  end

  def song_notes=(notes)
    
    notes.each do |note|
      self.notes.build(content: note)
    end
  end

  def note_contents
    content = []
    self.notes.each do |note|
      content << note.content
    end
    content
    
  end
  
  
end
