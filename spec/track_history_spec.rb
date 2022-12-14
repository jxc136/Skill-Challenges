require 'track_history'

RSpec.describe Song_Tracker do 

  context "Adds a single word track" do 

    it "returns a single track within array" do 
      song_tracker = Song_Tracker.new
      song_tracker.add("hello")
      expect(song_tracker.display).to eq ["hello"] 

    end 
  end 

  context "empty string is provided in add method"  do 

    it "Raises error" do 
      song_tracker = Song_Tracker.new
      expect {song_tracker.add("")}.to raise_error "track name must not be empty"
    end 
  end 

  context "entry with whitespace before words" do 
    it "removes whitespace" do 
      song_tracker = Song_Tracker.new
      song_tracker.add(" spacey  ")
      expect(song_tracker.display).to eq ["spacey"]
    end 
  end 

  context "duplicate entry" do 
    it "will not add entry" do
      song_tracker = Song_Tracker.new
      song_tracker.add("once")
      song_tracker.add("Death of a Bachelor")
      song_tracker.add("Hotel California")
      song_tracker.add("once")
      expect(song_tracker.display).to eq ["once","Death of a Bachelor","Hotel California"]

    end 
  end 

  context "add method used multiple times with unique entries" do 
    it "adds all unique entries" do 
      song_tracker = Song_Tracker.new 
      song_tracker.add("The End of the World")
      song_tracker.add("Yellow Submarine")
      song_tracker.add("Fly Me to the Moon")
      expect(song_tracker.display).to eq ["The End of the World","Yellow Submarine","Fly Me to the Moon"]

    end 
  end 

end 