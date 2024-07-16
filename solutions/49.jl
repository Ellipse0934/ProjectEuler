function digmap(i)
    v = zeros(Int8, 10)
    while i != 0
        v[i % 10 + 1] += 1
        i ÷= 10
    end
    v
end

function solve()
    sieve = ones(Bool, 10_000)
    primes = Int[]
    for i in 2:length(sieve)
        if sieve[i]
            mult = 2
            i > 1000 && push!(primes, i)
            while mult * i <= length(sieve)
                sieve[mult * i] = false
                mult += 1
            end
        end
    end

    for i in 1:length(primes)
        for j in (i + 1):length(primes)
            d = (primes[j] + primes[i]) ÷ 2
            if sieve[d] && 
                digmap(primes[i]) == digmap(primes[j]) &&
                digmap(d) == digmap(primes[i])
                if primes[i] != 1487
                    return string(primes[i], d, primes[j])
                end
            end 
        end
    end
end

