def call_block 
  print "start" 
  yield
  yield
  print "end"
end

call_block { puts "In the block" }

def who_says_what
  yield("Dave", "hello")
  yield("Andy", "Bye")
end

who_says_what { |person, phrase| puts "#{person} says #{phrase}" }