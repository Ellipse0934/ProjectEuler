"generate primes upto n"
function gen_primes(n)
    primes = [2]
    n < 3 && return primes 

    sieve = BitVector(undef, div(n, 2))
    sieve .= 1
    max_possible = round(Int, sqrt(n) + 1)
    i = 3
    while i <= n
        if sieve[div(i, 2)]
            push!(primes, i)
            sieve[div(i, 2)] = false
            ii = i
            while ii < n
                sieve[div(ii, 2)] = 0
                ii += 2*i
            end
        end
        i += 2
    end
    for (ind, val) in enumerate(sieve)
        if val
            if ind * 2 + 1 <= n
                push!(primes, ind * 2 + 1)
            end
        end
    end
    primes
end
