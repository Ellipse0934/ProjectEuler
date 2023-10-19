using BenchmarkTools

function solve()
    res = 0
    for i = 1:(1000 - 1)
        if i % 3 == 0 ||
            i % 5 == 0
            res += i
        end
    end
    res
end

println(solve())
@btime solve()
