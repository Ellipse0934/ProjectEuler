using BenchmarkTools
# Prime counting function is roughly
# pi(x) = x / lg(x)
#
f(x) = x / log(x)

# Using some guesses we know this will be less than 200k

function solve()
    primes = Int64[2]
    # Half of required cos no 2's
    sieve = BitVector(undef, (100_000))
    sieve .= 0
    count = 1

    iter = 3
    while count != 10_001
        if !sieve[div(iter, 2)]
            push!(primes, iter)
            count += 1
            i2 = iter
            while i2 <= 200_000
                if i2 % 2 == 1
                    sieve[div(i2, 2)] = true
                end
                i2 += iter
            end
        else
            iter += 2
        end
    end
    primes[end]
end

println(solve())
@btime (solve()) 
