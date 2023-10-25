# Silly solution with too many allocations and time taken
include("common/primes.jl")

function gen_panadigital(n)
    if n == 1
        return ["1"]
    elseif n == 2
        return ["12", "21"]
    end
    v = gen_panadigital(n - 1)
    u = []

    for e in v
        for i in 1:n
           s = if i == 1
               string(n, e)
           elseif i == n
               string(e, n)
           else
               string(e[1:(i - 1)], n, e[i:(n - 1)])
           end
           push!(u, s)
        end
    end
    return u
end

function is_prime(num, primes)
    if num <= primes[end]
        return num in primes
    else
        for i in 1:length(primes)
            p = primes[i]
            if num % p == 0
                return false
            end
            if p > round(Int, sqrt(num)) + 1
                return true 
            end
        end
        return true
    end
end

function solve()
    result = 0
    bound = round(Int, sqrt(987654321))
    primes = gen_primes(bound)
    for digits in 1:9
        for x in gen_panadigital(digits)
            num = parse(Int, x)
            if is_prime(num, primes)
                result = max(result, num)
            end
        end
    end
    result
end

