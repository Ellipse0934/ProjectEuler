include("common/primes.jl")

f(n, a, b) = n * n + a * n + b 

function solve()
    bound = 3 * 1000 * 1000
    primes = Set([p for p in gen_primes(bound)])
    val, best = -1, -1
    for a in -1000:1000
        for b in -1000:1000
            n = 0
            while f(n, a, b) in primes
                n += 1
            end
            if n > best
                val, best = a * b, n
            end
        end
    end
    val
end
