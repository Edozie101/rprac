
#New

#Creates a new dictionary which accepts one paramaters which
# is a number of buckets and is set to 256
# it then creates a bunch of arrays within this
# Dictionary (aDict = []) , equal to the number of buckets
# by using the (0...num_buckets).each do |i|
  aDict.push([])
  end

#Hash_key(aDict,key)
uses rubys built in "hash" function to convert a string into a number
Ruby uses this ofr its own hash structure...
once the number for the key is made I then use the %
operator and the aDict.length (256) to get a bucket where this can go

puts "HASH #{key}=#{key.hash}"
return key.hash % aDict.length

#get_bucket(aDict,key)
This function then uses hash key to find the bucket through the unique location
to find the bucket that the key COULD be in
Since I did key.hash % aDict.length in the hash_key function I know
that bucket_id I get will fit into the aDict array using the bucket_id I can
then find out where the key could be

bucket_id = hash_key(aDict,key)
return aDict[bucket_id]

#get_slot(aDict,key,default=nil)

This function uses get_bucket function to get the bucket a key could be in
then I need to roll through every element until it finds a matching key
Once it does it returns the tuple of i,k,v which is the index the key was found in
(hash_key(aDict,key)),the key itself, and the value set for the key
By finding the associated hashkey we have shortend the time to finding the key and value
to a fraction of what it would normally be.

bucket = get_bucket(aDict,key)
bucket.each_with_index do |kv,i|
  k, v = kv
  if key == k
    return i, k, v
  end
end
return -1, key, default


#get (aDict,key,default=nil)

This is a "Convenience Function" which does what most people want a Dict to do.
It uses get_slot to get the i,k,v and then just returns the value only.
The defualt serves as a fall back if the hash value does not exist or if it is set to nil
i,k,v = get_slot(aDict,key,default)
return v

#set(aDict,key,value)
To set a value you just need to get the bucket, through the get_bucket
method and then append the new value  however we want our Dict to let one,
key at a time. To do that we have to find the bucket and CHECK if the key already exists
if the key already exists then we replace this bucket with a new one.
This is actually slower than simply appending

bucket = get_bucket(aDict,key)
i, k, v = get_slot(aDict,key)

if i >= 0
if the bucket exists (i greater than or equal to 0)
set the bucket index to the key value
  bucket[i] = [key,value]
else
otherwise push the values into the empty bucket
  bucket.push[key,value]
end


#delete(aDict,key)

To delete a key, I simply get the bucket and search for the key in it and delete it from the array.
however because I chose to make a set only store one key and value pair, I can stop when I have found one. If
I had decided to allow multiple for each key by simply appending, I would have also made delete slower because, I would have needed to go through every slot on delete just incase it had a key/value par that matched.


bucket = get_bucket(aDict.key)
(0...bucket_length).each do |i|
  k, v = bucket[i]
  if key == k
    bucket.delete_at(i)
  end
end


#list(aDict)

The last functon just gets each bucket and goes through each slot in the bucket.

aDict.each do |bucket|
  if bucket
    bucket.each {|k,v| puts k, v}
    end
  end
end
