# Very slow solution. 33 seconds
# Possible optimization is that sieve will count the number of factors
include("common/primes.jl")

function factors(i, primes)
    factors = 0
    number = i
    for p in primes
        if number % p == 0
            while number % p == 0
                number ÷= p
            end
            factors += 1
        end
        if factors == 0 && p > round(Int, sqrt(i))
            return factors
        end
    end
    factors
end

function solve()
    primes = gen_primes(1_000_000)
    target = 4
    cur_count = 0
    for i in 1:1_000_000
        if factors(i, primes) == target
            cur_count += 1
        else
            cur_count = 0
        end
        if cur_count == target
            return i - target + 1
        end
    end
    nothing
end
