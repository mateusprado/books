def fib(n)
  return n if n < 2
  vals = [0, 1]
  n.times do
    vals.push(vals[-1] + vals[-2])
  end
  return vals.last
end


def fib_with_rescue(n)
  return n if n < 2
  vals = [0, 1]
  n.times do
    vals.push(vals[-1] + vals[-2])
  end
  return vals.last
rescue IOError
    puts "Will never get here"
end


require ’benchmark’
Benchmark.bm(10) { |bm|
  bm.report("no rescue") { 1000.times { fib(100)} }
  bm.report("rescue") {
    1000.times { fib_with_rescue(100) }
  }
}

output:
              user       system     total      real
no rescue   0.100000   0.000000   0.100000 (  0.096456)
rescue      0.070000   0.000000   0.070000 (  0.068319)

￼￼￼