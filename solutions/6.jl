using BenchmarkTools

function solve(r = 1:100)
    sq(x) = x * x
    a = mapreduce(x -> sq(x), +, r)
    b = reduce(+, r) |> sq 
    return b - a
end

println(solve())
@btime solve()
