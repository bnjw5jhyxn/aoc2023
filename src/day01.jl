module Day01

function partA(filename::AbstractString)::Int64
    s = 0
    for line in eachline(filename)
        str = strip(isletter, line)
        s += parse(Int64, String([str[begin], str[end]]))
    end
    s
end

digitStrings = Dict(
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "zero" => 0,
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9,
)

function firstDigit(str::AbstractString)::Int64
    minIndex = length(str) + 1
    firstDigit = -1
    for (s, d) in digitStrings
        r = findfirst(s, str)
        if r ≡ nothing
            continue
        end
        if first(r) < minIndex
            minIndex = first(r)
            firstDigit = d
        end
    end
    firstDigit
end

function lastDigit(str::AbstractString)::Int64
    maxIndex = -1
    lastDigit = -1
    for (s, d) in digitStrings
        r = findlast(s, str)
        if r ≡ nothing
            continue
        end
        if first(r) > maxIndex
            maxIndex = first(r)
            lastDigit = d
        end
    end
    lastDigit
end

function partB(filename::AbstractString)
    s = 0
    for line in eachline(filename)
        s += 10 * firstDigit(line) + lastDigit(line)
    end
    s
end

end