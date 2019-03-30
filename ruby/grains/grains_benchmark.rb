require 'benchmark'
require_relative 'grains'

SAMPLES = 100_000

Benchmark.bm(10) do |benchmark|
  [1, 2, 3, 4, 16, 32, 64].each do |n|
    benchmark.report("square(#{n})") { SAMPLES.times { Grains.square(n) } }
  end

  benchmark.report('total') { SAMPLES.times { Grains.total } }
end
