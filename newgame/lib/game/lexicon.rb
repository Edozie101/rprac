module Lexicon
  @allowed_words = {
  "direction" => ["north", "south","east","west"],
  "verbs" => ["go", "kill", "eat", "pick up","shoot","fire"],
  "nouns" => ["bear", "alien", "animal", "beast", "zombie","rat"]

}
  def self.scan(words)
    array = words.split
    newar = Array.new
    array.each do |a|
      @allowed_words.each do |k,v|
        if v == a
          newar.push([k,a])
        end
      end
    end
    return newar
  end

end
