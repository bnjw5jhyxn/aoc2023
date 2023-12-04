include("day01.jl")
include("day02.jl")

import .Day01
import .Day02

solutions = Dict(
    "1AE" => Day01.partA("input/01aexample.txt"),
    "1BE" => Day01.partB("input/01bexample.txt"),
    "2AE" => Day02.partA("input/02example.txt"),
    "2BE" => Day02.partB("input/02example.txt"),
    #"1A" => Day01.partA("input/01input.txt"),
    #"1B" => Day01.partB("input/01input.txt"),
    #"2A" => Day02.partA("input/02input.txt"),
    #"2B" => Day02.partB("input/02input.txt"),
)

for line in eachline()
    println(get(solutions, strip(uppercase(line)), "not computed"))
end