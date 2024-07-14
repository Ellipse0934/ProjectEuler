include("common/primes.jl")

function f(n, primes, prime_set, square_set)
    if n in prime_set 
        return true
    else
        for p in primes
            if p > n 
                return false
            end
            i = (n - p) ÷ 2
            if i in square_set 
                return true
            end
        end
        return false
    end
end

function solve()
    primes = gen_primes(100_000_000)
    ps = Set(primes)
    sqs = Set([i^2 for i in 1:1_000_000])

    for i in 9:2:10_000_000
        if !f(i, primes, ps, sqs)
            return i
        end
    end
end
