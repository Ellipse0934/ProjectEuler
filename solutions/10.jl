using BenchmarkTools
# pi(2_000_000) ~ 137k

function solve()
    result = 2
    sieve = BitVector(undef, 2_000_000)
    sieve .= false

    iter = 3
    while iter <= 2_000_000
        if !sieve[div(iter, 2)]
            result += iter
            i2 = iter
            while i2 <= length(sieve)
                sieve[div(i2, 2)] = true
                i2 += 2*iter
            end
        end
        iter += 2
    end
    result
end

println(solve())
@btime solve()
