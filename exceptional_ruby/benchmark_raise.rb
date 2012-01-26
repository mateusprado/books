def fib(n)
  return n if n < 2
  vals = [0, 1] n.times do
    vals.push(vals[-1] + vals[-2])
  end
  return vals.last
end

def fib_raise(n)
  return n if n < 2
  vals = [0, 1]
  i=0
  loop do
    vals.push(vals[-1] + vals[-2])
    i += 1
    raise if i >= n
  end
rescue RuntimeError
  return vals.last
end

require ’benchmark’
Benchmark.bm(10) { |bm|
  bm.report("fib") { 1000.times { fib(100)} }
  bm.report("fib_raise") {
    1000.times { fib_raise(100) }
  }
}
￼￼￼￼￼