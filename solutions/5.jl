using BenchmarkTools
# Kinda trivial

function solve()
    return 16 * 9 * 5 * 7 * 11 * 13 * 17 * 19
end

println(solve())
@btime solve()
