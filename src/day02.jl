module Day02

@enum Color begin
    red
    green
    blue
end

function stringToColor(str::AbstractString)::Color
    if str == "red"
        red
    elseif str == "green"
        green
    else
        blue
    end
end

const CubeSet = Dict{Color,Int64}
const Game = Tuple{Int64,Base.Generator{CubeSet}}

function cubeSubset(a::CubeSet, b::CubeSet)::Bool
    for c in instances(Color)
        if get(a, c, 0) > get(b, c, 0)
            return false
        end
    end
    return true
end

function parseColorReveal(str::AbstractString)::Tuple{Color,Int64}
    n, c = match(r"(\d+) (\p{Ll}+)", str)
    stringToColor(c), parse(Int64, n)
end

function parseGame(gameStr::AbstractString)
    (
        Dict(parseColorReveal(s) for s in eachsplit(str, ", "))
        for str in eachsplit(gameStr, "; ")
    )
end

function parseFile(filename::AbstractString)
    (
        begin
            (gameId,) = match(r"Game (\d+): ", line)
            (parse(Int64, gameId), parseGame(chopprefix(line, r"Game \d+: ")))
        end
        for line in eachline(filename)
    )
end

function partA(filename::AbstractString)::Int64
    bag = Dict(
        red => 12,
        green => 13,
        blue => 14,
    )
    s = 0
    for (id,reveals) in parseFile(filename)
        if all(r -> cubeSubset(r, bag), reveals)
            s += id
        end
    end
    s
end

function partB(filename::AbstractString)::Int64
    s = 0
    for (_, reveals) in parseFile(filename)
        bag = Dict()
        for r in reveals
            for (c, n) in r
                bag[c] = max(n, get(bag, c, 0))
            end
        end
        s += get(bag, red, 0) * get(bag, green, 0) * get(bag, blue, 0)
    end
    s
end

end