using BenchmarkTools

function solve()
    res = 2
    a = 3
    b = 5
    t = 8
    while t < 4_000_000
        if t % 2 == 0
            res += t
        end
        a, b = b, t
        t = a + b
    end
    res
end


println(solve())
@btime solve()
