function solve(n = 100)
    @assert n >= 2
    d = Dict{Tuple{Int, Int}, Int}()
    return ways(d, n, n - 1)
    
end

"ways(x, y) represents ways to write x with at max y"
function ways(d, x, y)
    if y > x
        return ways(d, x, x)
    end
    if y == 1
        return 1
    end
    if haskey(d, (x, y))
        return d[(x, y)]
    end
    acc = 0
    if x == y
        acc = 1
    end
    for i in min((x - 1), y):(-1):1
        acc += ways(d, x - i, i)
    end
    d[(x, y)] = acc
    acc
end


