class Dict
  attr_reader(:dict)
  def initialize(num_buckets=256)

    @@dict = []

    num_buckets.times do |a|
      @@dict.push([])
    end
    return @@dict
  end

  def hash_key(key)
    puts "HASH #{key} = #{key.hash}"
    return key.hash % @@dict.length
  end

  def get_bucket(key)
    #Find the bucket where the keys are located
    index = hash_key(key)

    return  @@dict[index]
  end

  def get_slot(key,default=nil)
    #returns the index key and value of a slot found
    bucket = get_bucket(key)
    bucket.each_with_index do |kv,i|
      k,v = kv
      if key == k
        return i,k,v
        puts "Index is #{i}, Key is #{k} and the value is #{v}"
      end

    end

    return -1, key, default
  end

  def set_bucket(key,value,default=nil)
    #simplify the key and value
    i,k,v = get_slot(key)
    #get the target bucket for the key and value
    target = get_bucket(key)
    #cycle through each slot of the bucket

    if i >= 0
      #this i is an index value of the location of the key
      #from the get slot value, it returns -1 if the key is nonexistant
      target[i] = [key,value]
      p "#{key} => #{value}"
    else
      #we push the key value pair into the target bucket if it doesnt exist
      target.push([key,value])
      p "#{key} => #{value}"
    end
  end

  def get(key)
    i,k,v = get_slot(key)
    p v
  end

  def list
    @@dict.each do |a|
      if !a.empty?
        a.each {|k,v| puts "#{k} => #{v}"}

      end
    end
  end

end

a = Dict.new
a.set_bucket("hello","world")
