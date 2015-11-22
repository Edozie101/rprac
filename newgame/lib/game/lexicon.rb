module Lexicon
  @allowed_words = {
  "direction" => ["north", "south","east","west"],
  "verb" => ["go", "kill", "eat", "pick up","shoot","fire"],
  "nouns" => ["bear", "alien", "animal", "beast", "zombie","rat"],
  "end" => ["the"],
  "error" => ["them","idiots"]
 }
  def self.scan(words)
    array = words.split
    newar = []
    array.each do |a|
      @allowed_words.each do |k,v|
        if v.include?(a)
          newar.push([k,a])
        end
      end
    end
    return newar
  end

end
