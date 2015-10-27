require 'open-uri'

WORD_URL = "http://learncodethehardway.org/words.txt"
WORDS = []

#phrases are set of Regex ready  questions keys and answers value
#for class inheritance , Intialization into a variable , class functions, Class initialzation function,

PHRASES = {
  "class ### < ###\nend" =>
       "Make a class named ### that is-a ###.",
  "class ###\n\tdef initialize(@@@)\n\tend\nend" =>
       "class ### has-a initialize that takes @@@ parameters.",
  "class ###\n\tdef ***(@@@)\n\tend\nend" =>
       "class ### has-a function named *** that takes @@@ parameters.",
  "*** = ###.new()" =>
       "Set *** to an instance of class ###.",
  "***.***(@@@)" =>
       "From *** get the *** function, and call it with parameters @@@.",
  "***.*** = '***'" =>
       "From *** get the *** attribute and set it to '***'."
}
# remembers if you put "english" as the first ARGV returns a boolean if you did

PHRASE_FIRST = ARGV[0] == "english"

open(WORD_URL) {|f|
  f.each_line {|word| WORDS.push(word.chomp)}
}


#make names or class names using random words, the snippet of the phrase
# and the pattern in the snippet that you want to replace
def craft_names(rand_words, snippet, pattern, caps=false)
  names = snippet.scan(pattern).map do
    word = rand_words.pop()
    caps ? word.capitalize : word
  end

  return names * 2
end

def craft_params(rand_words, snippet, pattern)
  # make params from random words , the snippit of phrase ,
  # and the pattern we are going to substitute.
  names = (0...snippet.scan(pattern).length).map do
    #set a random number of parameters (4...1)
    param_count = rand(3) + 1
    #create an array of rand_words with a length equal to the param_count
    params = (0...param_count).map {|x| rand_words.pop() }
    #turn  it into a string
    params.join(', ')
  end

  return names * 2
end


#convert the sippet of Phrase (key) into an actual
def convert(snippet, phrase)
  #Randomly sort words and shuffle sort_by {rand}
  rand_words = WORDS.sort_by {rand}
  #generate class names using the craft names , and replace the with "/###/"
  class_names = craft_names(rand_words, snippet, /###/, caps=true)
  #generate other names with random words that takes the snippet and then replaces /\*\*\*/
  other_names = craft_names(rand_words, snippet, /\*\*\*/)
  #generate param names that  will be switched into the /@@@/
  param_names = craft_params(rand_words, snippet, /@@@/)

  results = []

  [snippet, phrase].each do |sentence|
    # fake class names, also copies sentence
    #sets result variable to the sentence substituted with some class names.
    result = sentence.gsub(/###/) {|x| class_names.pop }

    # fake other names
    #just takes the Snippet (Question ) and the Phrase (Answer) and replaces /\*\*\*/ with the other name generated with
    #other_names , they are just contatined in an array so you can pop them out.
    result.gsub!(/\*\*\*/) {|x| other_names.pop }

    # fake parameter lists
    #Takes the snippet and the Phrase and replaces the /@@@/ with a param name  same as above DESTRUCTIVELY
    result.gsub!(/@@@/) {|x| param_names.pop }
    # pushes the Question and the answer into the results array like [snippet,phrase ] or [question , answer]
    results.push(result)
  end
  #returns this array
  return results
end

# keep going until they hit CTRL-D

loop do
  #snippets are the keys or questions
  #get a bunch of questions randomly
  snippets = PHRASES.keys().sort_by {rand}
  #for each snippet [question] in the snippets array
  for snippet in snippets
    #phrase is the answer
    #find the corresponding answer with the snippet
    phrase = PHRASES[snippet]
    #since the convert function returns an array with the [snippet , phrase ]
    #turns the variables into question, answers
    question, answer = convert(snippet, phrase)

    if PHRASE_FIRST
      #if you put "english" as the first ARGV it reverses the question and answer to then have the answer be the question
      question, answer = answer, question
    end
    # prints the question and some new lines
    print question, "\n\n> "

    # exits the program unless or not if you keep on pressing enter
    exit(0) unless $stdin.gets
    # puts answer and substitutes the answer and then prints 2 new lines.
    puts "\nANSWER:  %s\n\n" % answer
  end
end
