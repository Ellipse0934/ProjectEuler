using BenchmarkTools
"Generate primes upto n"
function gen_primes(n::Int)
    primes = [2]
    n < 3 && return primes 

    sieve = BitVector(undef, div(n, 2))
    sieve .= 1
    max_possible = round(Int, sqrt(n) + 1)
    for i in 3:2:max_possible
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
            push!(primes, ind * 2 + 1)
        end
    end
    primes
end


function divisors(x, p)
    ans = 1
    p_ind = 1
    while x != 1
        cur = 0
        while x % p[p_ind] == 0
            cur += 1
            x /= p[p_ind]
        end
        if cur != 0
            ans *= cur + 1
        end
        p_ind += 1
        if p_ind == length(p)
            ans *= 2
            break
        end
    end
    ans
end

function solve()
    primes = gen_primes(1000)
    
    triangle(x) = div(x * (x + 1), 2)
    for i in 1:1_000_000
        r = divisors(triangle(i), primes)
        if r > 500
            return (i, triangle(i), r)
            break
        end
    end
    nothing
end

println(solve())
@btime solve()

