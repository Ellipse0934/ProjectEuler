include("common/primes.jl")


function tp(n, s)
    str = string(n)
    for l in 1:length(str)
        i = parse(Int, str[1:l])
        if !in(i, s)
            return false
        end
        j = parse(Int, str[(end - l + 1):end])
        if !in(j, s)
            return false
        end
    end
    return true
end

function solve()
    primes = Set{Int}(gen_primes(1_000_000))
    mapreduce(x -> x > 10 && tp(x, primes) ? x : 0, +, primes)
end
